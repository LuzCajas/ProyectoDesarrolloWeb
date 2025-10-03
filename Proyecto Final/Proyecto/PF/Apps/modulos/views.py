from django.shortcuts import render, get_object_or_404
from django.views.generic import TemplateView, DetailView, UpdateView
from .models import Producto, Categoria
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

class detalleView(DetailView):
    model = Producto
    template_name = 'detalle.html'

def ListarCategorias(request):
    categorias = Categoria.objects.all()
    return render(request, 'categorias.html', {'categorias': categorias})

