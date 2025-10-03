from django.contrib import admin
from django.urls import path, include
from Apps.home import views
from .views import modulosView, ListarProductos, detalleView
app_name = 'modulos'

urlpatterns = [
    path('', ListarProductos, name='modulosapp'),
    path('detalle/<int:pk>/', detalleView.as_view(), name='detalleapp' ),
]