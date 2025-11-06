from django import forms
from Apps.modulos.models import Categoria, Producto
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from Apps.modulos.models import Usuario

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nombre', 'descripcion']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre de la categoría'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Descripción de la categoría', 'rows': 3}),
        }

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ['nombre', 'descripcion', 'precio', 'categoria', 'imagen']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre del producto'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Descripción del producto', 'rows': 3}),
            'precio': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Precio del producto'}),
            'categoria': forms.Select(attrs={'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # 🔹 Sobrescribimos el texto que aparece en el dropdown
        self.fields['categoria'].queryset = Categoria.objects.all()
        self.fields['categoria'].label_from_instance = lambda obj: obj.nombre

class RegistroForm(UserCreationForm):
    first_name = forms.CharField(max_length=140, required=True)
    last_name = forms.CharField(max_length=140, required=False)
    email = forms.EmailField(required=True)
    telefono = forms.CharField(max_length=8, required=False)
    direccion = forms.CharField(max_length=255, required=False)

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'telefono', 'direccion', 'username', 'email', 'password1', 'password2')

    def save(self, commit=True):
        user = super().save(commit)
        # Guardamos los datos en el modelo Usuario relacionado
        usuario, created = Usuario.objects.get_or_create(perfil=user)
        usuario.telefono = self.cleaned_data.get('telefono')
        usuario.direccion = self.cleaned_data.get('direccion')
        usuario.save()
        return user