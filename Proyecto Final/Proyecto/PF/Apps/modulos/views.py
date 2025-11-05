from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import TemplateView, DetailView, UpdateView, CreateView
from .models import Producto, Categoria
from django.urls import reverse_lazy
from django.urls import reverse
from Apps.home.forms import ProductoForm
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin


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

