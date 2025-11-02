from django.db import models
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.db.models.signals import post_save

class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE)
    def __str__(self):
        return '%s %s %s %s %s' % (self.nombre, self.descripcion, self.precio, self.stock, self.categoria)

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

class Pedido(models.Model):
    usuario = models.ForeignKey('Usuario', on_delete=models.CASCADE)
    fecha = models.DateTimeField(auto_now_add=True)
    total = models.DecimalField(max_digits=10, decimal_places=2)
    efectivo_o_tarjeta = models.Choices('Efectivo', 'Tarjeta')

    def __str__(self):
        return '%s %s %s %s' % (self.usuario, self.fecha, self.total, self.efectivo_o_tarjeta)