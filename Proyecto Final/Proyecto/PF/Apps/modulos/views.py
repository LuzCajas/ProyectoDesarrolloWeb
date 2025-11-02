from django.shortcuts import render, get_object_or_404
from django.views.generic import TemplateView, DetailView, UpdateView, CreateView
from .models import Producto, Categoria
from django.urls import reverse_lazy
from django.urls import reverse
from Apps.home.forms import ProductoForm


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

class CrearProducto(CreateView):
    template_name = 'crear_producto.html'
    form_class = ProductoForm

    def get_success_url(self):
        # self.object es el Producto recién creado
        categoria_id = self.object.categoria.id  # asumiendo que tu Producto tiene campo 'categoria'
        # Genera la URL incluyendo el parámetro de categoría
        return f"{reverse('modulos:modulosapp')}?categoria={categoria_id}"

class EditarProducto(UpdateView):
    model = Producto
    template_name = 'editar_producto.html'
    fields = ['nombre', 'descripcion', 'precio', 'categoria']
    
    def get_success_url(self):
        # self.object es el Producto recién creado
        categoria_id = self.object.categoria.id  # asumiendo que tu Producto tiene campo 'categoria'
        # Genera la URL incluyendo el parámetro de categoría
        return f"{reverse('modulos:modulosapp')}?categoria={categoria_id}"

class detalleView(DetailView):
    model = Producto
    template_name = 'detalle.html'

def ListarCategorias(request):
    categorias = Categoria.objects.all()
    return render(request, 'categorias.html', {'categorias': categorias})

