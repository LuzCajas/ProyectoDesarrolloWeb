from django.contrib import admin
from .models import Producto, Categoria, Pedido, Usuario   

admin.site.register(Producto)
admin.site.register(Categoria) 
admin.site.register(Pedido)
admin.site.register(Usuario)
