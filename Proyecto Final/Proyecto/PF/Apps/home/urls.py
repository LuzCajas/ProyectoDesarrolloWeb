from django.contrib import admin
from django.urls import path, include
from Apps.home import views
from .views import HomeView
from Apps.modulos.views import ListarProductos
from .views import ListarCategorias
app_name = 'home'

urlpatterns = [
    path('home/', ListarCategorias, name='homeapp'),
    path('crear_categoria/', views.CrearCategoria.as_view(), name='crearcategoriaapp'),
    path('editar_categoria/<int:pk>/', views.EditarCategoria.as_view(), name='editarcategoriaapp'),
    path('modulos/', ListarProductos, name='modulosapp'),
    path('registro/', views.RegistroView.as_view(), name='registroapp'),
    path('login/', views.LoginView.as_view(), name='loginapp'),
    path('logout/', views.logout_view, name='logoutapp'),
]