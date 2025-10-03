from django.db import models

class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    categoria = models.ForeignKey('Categoria', on_delete=models.CASCADE)
    def __str__(self):
        return '%s %s %s %s %s' % (self.nombre, self.descripcion, self.precio, self.stock, self.categoria)

class Categoria(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()

    def __str__(self):
        return '%s %s' % (self.nombre, self.descripcion)

class Cliente(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    email = models.EmailField()
    telefono = models.CharField(max_length=15)
    direccion = models.CharField(max_length=255)
    def __str__(self):
        return '%s %s %s %s %s' % (self.nombre, self.apellido, self.email, self.telefono, self.direccion)

class Pedido(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    fecha = models.DateTimeField(auto_now_add=True)
    total = models.DecimalField(max_digits=10, decimal_places=2)
    efectivo_o_tarjeta = models.Choices('Efectivo', 'Tarjeta')

    def __str__(self):
        return '%s %s %s %s' % (self.cliente, self.fecha, self.total, self.efectivo_o_tarjeta)
    
class Usuario(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    email = models.EmailField()
    telefono = models.CharField(max_length=15)
    rol = models.Choices('Administrador', 'Empleado')
    def __str__(self):
        return '%s %s %s %s %s' % (self.nombre, self.apellido, self.email, self.telefono, self.rol)