from django.shortcuts import render
from django.views.generic import TemplateView, CreateView, UpdateView
from Apps.modulos.models import Categoria
from django.urls import reverse_lazy
from .forms import CategoriaForm, RegistroForm
from django.contrib.auth.views import LoginView
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect

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

class EditarCategoria(UpdateView):
    template_name = 'editar_categoria.html'
    form_class = CategoriaForm
    success_url = reverse_lazy('home:homeapp')
    model = Categoria

class LoginView(LoginView):
    template_name = 'login.html'

def login_view(request):
    next_url = request.GET.get('next') 
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            if next_url:  
                return redirect(next_url)
            return redirect('home:homeapp')  
        else:
            context = {'error': 'Usuario o contraseña incorrectos', 'next': next_url}
            return render(request, 'home:login', context)
    return render(request, 'home:login', {'next': next_url})

def logout_view(request):
    logout(request)
    return redirect('home:homeapp')

class RegistroView(CreateView):
    template_name = 'registro.html'
    form_class = RegistroForm
    success_url = reverse_lazy('home:homeapp')