from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import TemplateView, DetailView, UpdateView, CreateView
from .models import Producto, Categoria
from django.urls import reverse_lazy
from django.urls import reverse
from Apps.home.forms import ProductoForm
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.shortcuts import redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from Apps.modulos.models import Producto, Carrito, ItemCarrito
from .models import Carrito, ItemCarrito, Categoria
from decimal import Decimal
from django.db import transaction
from .models import Pedido, DetallePedido
from django.shortcuts import render
from django.contrib import messages

# Create your views here.
class modulosView(TemplateView):
    template_name = 'modulos.html'

def ListarProductos(request):
    categoria_id = request.GET.get('categoria')  # obtiene el id de la categoría desde la URL
    categoria = None
    productos = Producto.objects.all()

    if categoria_id:
        categoria = get_object_or_404(Categoria, id=categoria_id)
        productos = productos.filter(categoria=categoria)

    return render(request, 'modulos.html', {
        'productos': productos,
        'categoria': categoria
    })

class CrearProducto(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    template_name = 'crear_producto.html'
    form_class = ProductoForm
    login_url = '/login/'  # Redirige a tu pantalla de login personalizada

    def get_success_url(self):
        categoria_id = self.object.categoria.id
        return f"{reverse('modulos:modulosapp')}?categoria={categoria_id}"

    def handle_no_permission(self):
        if not self.request.user.is_authenticated:
            return redirect(self.login_url)
        return redirect('home:homeapp')

    def test_func(self):
        return self.request.user.is_staff


class EditarProducto(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Producto
    template_name = 'editar_producto.html'
    login_url = '/login/'  # Redirige a tu pantalla de login personalizada
    form_class = ProductoForm

    def get_success_url(self):
        categoria_id = self.object.categoria.id
        return f"{reverse('modulos:modulosapp')}?categoria={categoria_id}"

    def handle_no_permission(self):
        if not self.request.user.is_authenticated:
            return redirect(self.login_url)
        return redirect('home:homeapp')

    def test_func(self):
        return self.request.user.is_staff

class detalleView(DetailView):
    model = Producto
    template_name = 'detalle.html'

def ListarCategorias(request):
    categorias = Categoria.objects.all()
    return render(request, 'categorias.html', {'categorias': categorias})

# Vista para carrito de compras
@login_required
def agregar_al_carrito(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    carrito, creado = Carrito.objects.get_or_create(usuario=request.user)

    item, creado = ItemCarrito.objects.get_or_create(carrito=carrito, producto=producto)
    if not creado:
        item.cantidad += 1
    item.save()

    return redirect('modulos:ver_carrito')

@login_required
def ver_carrito(request):
    carrito, creado = Carrito.objects.get_or_create(usuario=request.user)
    return render(request, 'carrito.html', {'carrito': carrito})

@login_required
@transaction.atomic
def confirmar_pedido(request):
    carrito = get_object_or_404(Carrito, usuario=request.user)
    if not carrito.items.exists():
        return redirect('modulos:ver_carrito')

    pedido = Pedido.objects.create(
        usuario=request.user,
        total=carrito.total()
    )

    for item in carrito.items.all():
        DetallePedido.objects.create(
            pedido=pedido,
            producto=item.producto,
            cantidad=item.cantidad,
            subtotal=item.subtotal()
        )

    carrito.items.all().delete()  # Vaciar carrito
    return render(request, 'pedido_confirmado.html', {'pedido': pedido})

@login_required
def eliminar_item_carrito(request, item_id):
    item = get_object_or_404(ItemCarrito, id=item_id, carrito__usuario=request.user)

    if request.method == 'POST':
        item.delete()
        messages.success(request, f'El producto "{item.producto.nombre}" fue eliminado del carrito.')
        return redirect('modulos:ver_carrito')

    # Si se accede por GET (no debería), redirige igual
    return redirect('modulos:ver_carrito')