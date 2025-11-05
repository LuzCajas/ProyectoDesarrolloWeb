from django.contrib import admin
from django.urls import path, include
from Apps.home import views
from .views import modulosView, ListarProductos, detalleView, CrearProducto, EditarProducto
from Apps.modulos import views

app_name = 'modulos'

urlpatterns = [
    path('', ListarProductos, name='modulosapp'),
    path('crear_producto/', CrearProducto.as_view(), name='crearproductoapp' ),
    path('editar_producto/<int:pk>/', EditarProducto.as_view(), name='editarproductoapp' ),
    path('detalle_producto/<int:pk>/', detalleView.as_view(), name='detalleapp' ),
    path('agregar/<int:producto_id>/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path('carrito/', views.ver_carrito, name='ver_carrito'),
    path('confirmar/', views.confirmar_pedido, name='confirmar_pedido'),
    path('carrito/eliminar/<int:item_id>/', views.eliminar_item_carrito, name='eliminar_item_carrito'),
]