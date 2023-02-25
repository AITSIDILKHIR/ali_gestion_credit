from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Carousel(models.Model):
    title = models.CharField(max_length=200, null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    image = models.FileField(null=True, blank=True)
    def __str__(self):
        return self.title
class Category(models.Model):
    name = models.CharField(max_length=100, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True, blank=True)
    name = models.CharField(max_length=100, null=True, blank=True)
    image = models.FileField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    price = models.CharField(max_length=100, null=True, blank=True)
    discount = models.CharField(max_length=100, null=True, blank=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class UserProfile(models.Model):
    user = models.ForeignKey (User, on_delete=models.CASCADE, null=True, blank=True)
    mobile = models.CharField(max_length=100, null=True, blank=True)
    address = models.TextField(null=True, blank=True)
    image = models.FileField(null=True, blank=True)
   
    def __str__(self):
        return self.user.username

class Clients(models.Model):
    
    nom = models.CharField(max_length=100, null=True, blank=True)
    prenom= models.CharField(max_length=100, null=True, blank=True)
    adresse = models.CharField(max_length=100, null=True, blank=True)
    contact = models.CharField(max_length=100, null=True, blank=True)
    image = models.FileField(null=True, blank=True)
    credit=models.FloatField(max_length=100, null=True, blank=True)
    
    cin = models.CharField(max_length=100, null=True, blank=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nom

class Credits(models.Model):
    client = models.ForeignKey(Clients, on_delete=models.CASCADE, null=True, blank=True)
    
    montant = models.FloatField(max_length=100, null=True, blank=True)
    durée=models.FloatField(max_length=100, null=True, blank=True)
    etat_credit=models.TextField(default="non reglé")
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)

