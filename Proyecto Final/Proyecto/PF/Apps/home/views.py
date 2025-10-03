from django.shortcuts import render
from django.views.generic import TemplateView, CreateView
from Apps.modulos.models import Categoria
from django.urls import reverse_lazy
from .forms import CategoriaForm

# Create your views here.

class HomeView(TemplateView):
    template_name = 'home.html'

def ListarCategorias(request):
    categorias = Categoria.objects.all()
    return render(request, 'home.html', {'categorias': categorias})

class CrearCategoria(CreateView):
    template_name = 'crear_categoria.html'
    form_class = CategoriaForm
    success_url = reverse_lazy('home:homeapp')

