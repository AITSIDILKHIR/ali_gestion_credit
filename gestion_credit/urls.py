"""gestion_credit URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app1 import views
from app1.views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('index/', index, name="index"),
    path('about/', about, name="about"),
    path('main/', main, name="main"),
    path('', adminLogin, name="admin_login"),
    path('adminhome/', adminHome, name="adminhome"),
    path('admindashboard/', admin_dashboard, name="admindashboard"),
    path('add-category/', add_category, name="add_category"),
    path('view-catgory/', view_category, name="view_category"),
    path('edit-category/<int:pid>/', edit_category, name="edit_category"),
    path('delete-category/<int:pid>/', delete_category, name="delete_category"),
    path('add-product/', add_product, name='add_product'),
    path('view-product/', view_product, name='view_product'),
    path('edit-product/<int:pid>/', edit_product, name="edit_product"),
    path('delete-product/<int:pid>/', delete_product, name="delete_product"),
    path('registration/', registration, name="registration"),
    path('add-client/', add_client, name='add_client'),
    path('view-clients/', view_client, name='view_client'),
    path('edit-client/<int:pid>/', edit_client, name="edit_client"),
    path('delit-client/<int:pid>/', delete_client, name="delete_client"),
    path('add-credit/', add_credit, name='add_credit'),
    path('view-credit/', view_credit, name='view_credit'),
    path('edit-credit/<int:pid>/', edit_credit, name="edit_credit"),
    path('delete-credits/<int:pid>/', delete_credits, name="delete_credits"),
    

]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
