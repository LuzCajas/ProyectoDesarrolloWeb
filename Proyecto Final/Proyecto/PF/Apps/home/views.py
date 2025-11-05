from django.shortcuts import render
from django.views.generic import TemplateView, CreateView, UpdateView
from Apps.modulos.models import Categoria
from django.urls import reverse_lazy
from .forms import CategoriaForm, RegistroForm
from django.contrib.auth.views import LoginView
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect
from django.contrib.auth.mixins import UserPassesTestMixin, LoginRequiredMixin

# Create your views here.

class HomeView(TemplateView):
    template_name = 'home.html'

def ListarCategorias(request):
    categorias = Categoria.objects.all()
    return render(request, 'home.html', {'categorias': categorias})

class CrearCategoria(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    template_name = 'crear_categoria.html'
    form_class = CategoriaForm
    success_url = reverse_lazy('home:homeapp')

    # Redirige al login si no está autenticado
    login_url = reverse_lazy('home:loginapp')

    # Verifica si es staff
    def test_func(self):
        return self.request.user.is_staff

    # Redirige al home si no tiene permisos
    def handle_no_permission(self):
        if self.request.user.is_authenticated:
            return redirect('home:homeapp')
        else:
            return redirect('home:loginapp')

class EditarCategoria(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    template_name = 'editar_categoria.html'
    form_class = CategoriaForm
    success_url = reverse_lazy('home:homeapp')
    model = Categoria

    def test_func(self):
        return self.request.user.is_staff

    # Redirige al login si no está autenticado
    login_url = reverse_lazy('home:loginapp')

    # Verifica si es staff
    def test_func(self):
        return self.request.user.is_staff

    # Redirige al home si no tiene permisos
    def handle_no_permission(self):
        if self.request.user.is_authenticated:
            return redirect('home:homeapp')
        else:
            return redirect('home:loginapp')

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
            return render(request, 'login.html', context)
    return render(request, 'login.html', {'next': next_url})

def logout_view(request):
    logout(request)
    return redirect('home:homeapp')

class RegistroView(CreateView):
    template_name = 'registro.html'
    form_class = RegistroForm
    success_url = reverse_lazy('home:homeapp')

def registro(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')  # o a donde quieras redirigir
    else:
        form = RegistroForm()
    return render(request, 'registro.html', {'form': form})