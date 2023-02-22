from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import *

admin.site.register(Carousel)
from .models import Category
admin.site.register(Category)
from .models import Product
admin.site.register(Product)
from .models import UserProfile
admin.site.register(UserProfile)

from .models import Clients
admin.site.register(Clients)

from .models import Credits
admin.site.register(Credits)
