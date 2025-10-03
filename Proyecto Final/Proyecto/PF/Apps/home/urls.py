from django.contrib import admin
from django.urls import path, include
from Apps.home import views
from .views import HomeView
from Apps.modulos.views import ListarProductos
from .views import ListarCategorias
app_name = 'home'

urlpatterns = [
    path('home/', ListarCategorias, name='homeapp'),
    path('crear_categoria/', views.CrearCategoria.as_view(), name='crear_categoria'),
    path('modulos/', ListarProductos, name='modulosapp'),
]