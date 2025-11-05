from django.db import models
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.db.models.signals import post_save

class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE)
    disponible = models.BooleanField(default=True)
    def __str__(self):
        return '%s %s %s %s %s' % (self.nombre, self.descripcion, self.precio, self.disponible, self.categoria)

class Categoria(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()

    def __str__(self):
        return '%s %s' % (self.nombre, self.descripcion)
    
class Usuario(models.Model):
    perfil = models.OneToOneField(User, on_delete=models.CASCADE)
    telefono = models.CharField(max_length=8, blank=True)
    direccion = models.CharField(max_length=255, blank=True)
    def __str__(self):
        return self.perfil.username
    
@receiver(post_save, sender=User)
def crear_usuario(sender, instance, created, **kwargs):
    if created:
        Usuario.objects.create(perfil=instance)

@receiver(post_save, sender=User)
def guardar_usuario(sender, instance, created, **kwargs):
    instance.usuario.save()

# Modelo para el carrito de compras
    
class Carrito(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    creado_en = models.DateTimeField(auto_now_add=True)

    def total(self):
        return sum(item.subtotal() for item in self.items.all())

    def __str__(self):
        return f"Carrito de {self.usuario.username}"

class ItemCarrito(models.Model):
    carrito = models.ForeignKey(Carrito, related_name='items', on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def subtotal(self):
        return self.producto.precio * self.cantidad

class Pedido(models.Model):
    ESTADOS = [
        ('pendiente', 'Pendiente'),
        ('despachado', 'Despachado'),
    ]

    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha = models.DateTimeField(auto_now_add=True)
    estado = models.CharField(max_length=20, choices=ESTADOS, default='pendiente')

    def __str__(self):
        return f"Pedido #{self.id} - {self.usuario.username}"

    @property
    def total(self):
        return sum(item.subtotal for item in self.items.all())


class PedidoItem(models.Model):
    pedido = models.ForeignKey(Pedido, related_name='items', on_delete=models.CASCADE)
    producto = models.ForeignKey('Producto', on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    @property
    def subtotal(self):
        return self.producto.precio * self.cantidad
