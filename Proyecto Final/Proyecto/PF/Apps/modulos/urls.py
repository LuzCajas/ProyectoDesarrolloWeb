from django.contrib import admin
from django.urls import path, include
from Apps.home import views
from .views import modulosView, ListarProductos, detalleView, CrearProducto, EditarProducto
app_name = 'modulos'

urlpatterns = [
    path('', ListarProductos, name='modulosapp'),
    path('crear_producto/', CrearProducto.as_view(), name='crearproductoapp' ),
    path('editar_producto/<int:pk>/', EditarProducto.as_view(), name='editarproductoapp' ),
    path('detalle_producto/<int:pk>/', detalleView.as_view(), name='detalleapp' ),
]