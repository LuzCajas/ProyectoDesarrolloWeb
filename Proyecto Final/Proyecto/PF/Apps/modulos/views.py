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
from .models import Pedido
from django.shortcuts import render
from django.contrib import messages

# Create your views here.
class modulosView(TemplateView):
    template_name = 'modulos.html'

def ListarProductos(request):
    categoria_id = request.GET.get('categoria')
    categoria = None
    productos = Producto.objects.filter(disponible=True)  # solo los disponibles

    if categoria_id:
        categoria = get_object_or_404(Categoria, id=categoria_id)
        productos = productos.filter(categoria=categoria, disponible=True)

    return render(request, 'modulos.html', {
        'productos': productos,
        'categoria': categoria
    })


class CrearProducto(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    template_name = 'crear_producto.html'
    form_class = ProductoForm
    login_url = '/login/'  # Redirige a tu pantalla de login personalizada

    def form_valid(self, form):
        # Guarda la imagen correctamente
        self.object = form.save(commit=False)
        self.object.save()
        return super().form_valid(form)

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
    login_url = '/login/' 
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
    
@login_required
def eliminar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)

    if not request.user.is_staff:
        messages.error(request, "No tienes permiso para eliminar productos.")
        return redirect('modulos:detalle', pk=producto.id)

    if request.method == 'POST':
        producto.disponible = False  # Solo se marca como no disponible
        producto.save()
        categoria_id = producto.categoria.id
        messages.success(request, f'El producto "{producto.nombre}" fue marcado como no disponible.')
        return redirect(f"{reverse('modulos:modulosapp')}?categoria={categoria_id}")

    return redirect('modulos:detalle', pk=producto.id)


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

    # Si el carrito está vacío, volver al carrito
    if not carrito.items.exists():
        messages.warning(request, "Tu carrito está vacío.")
        return redirect('modulos:ver_carrito')

    # Crear el pedido
    pedido = Pedido.objects.create(usuario=request.user)

    # Copiar cada producto del carrito al pedido
    for item in carrito.items.all():
        from .models import PedidoItem  # Asegúrate de importar correctamente
        PedidoItem.objects.create(
            pedido=pedido,
            producto=item.producto,
            cantidad=item.cantidad
        )

    # Vaciar el carrito
    carrito.items.all().delete()

    messages.success(request, f"Pedido #{pedido.id} confirmado exitosamente.")
    return redirect('modulos:detalle_pedido', pedido_id=pedido.id)

@login_required
def eliminar_item_carrito(request, item_id):
    item = get_object_or_404(ItemCarrito, id=item_id, carrito__usuario=request.user)

    if request.method == 'POST':
        item.delete()
        messages.success(request, f'El producto "{item.producto.nombre}" fue eliminado del carrito.')
        return redirect('modulos:ver_carrito')

    # Si se accede por GET (no debería), redirige igual
    return redirect('modulos:ver_carrito')

#historial de pedidos
@login_required
def historial_pedidos(request):
    if request.user.is_staff:
        pedidos = Pedido.objects.all().order_by('-fecha')
    else:
        pedidos = Pedido.objects.filter(usuario=request.user).order_by('-fecha')
    return render(request, 'historial_pedidos.html', {'pedidos': pedidos})


@login_required
def detalle_pedido(request, pedido_id):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    detalles = pedido.items.all() 

    # Verificación de permisos
    if not request.user.is_staff and pedido.usuario != request.user:
        return redirect('modulos:historial_pedidos')

    return render(request, 'detalle_pedido.html', {'pedido': pedido, 'detalles': detalles})


@login_required
def cambiar_estado_pedido(request, pedido_id):
    if request.user.is_staff:
        pedido = get_object_or_404(Pedido, id=pedido_id)
        if pedido.estado == 'pendiente':
            pedido.estado = 'despachado'
        else:
            pedido.estado = 'pendiente'
        pedido.save()
    return redirect('modulos:detalle_pedido', pedido_id=pedido_id)