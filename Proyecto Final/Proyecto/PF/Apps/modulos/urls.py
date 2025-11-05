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
    path('producto/eliminar/<int:producto_id>/', views.eliminar_producto, name='eliminar_producto'),
    path('agregar/<int:producto_id>/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path('carrito/', views.ver_carrito, name='ver_carrito'),
    path('confirmar/', views.confirmar_pedido, name='confirmar_pedido'),
    path('carrito/eliminar/<int:item_id>/', views.eliminar_item_carrito, name='eliminar_item_carrito'),
    path('historial/', views.historial_pedidos, name='historial_pedidos'),
    path('pedido/<int:pedido_id>/', views.detalle_pedido, name='detalle_pedido'),
    path('pedido/<int:pedido_id>/estado/', views.cambiar_estado_pedido, name='cambiar_estado_pedido'),
]