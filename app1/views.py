from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth import authenticate,login
from .models import *

from django.contrib.auth.models import User

def home(request):
    return render(request, 'home.html')
# Create your views here.
def index(request):
    return render(request, 'navigation.html')
def about(request):
    return render(request, 'about.html')

from .models import Carousel
from .models import Clients
def main(request):
    data = Carousel.objects.all()
    dic = {'data':data}
    return render(request, 'index.html', dic)
def adminLogin(request):
    
    msg = None
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        try:
            if user.is_staff:
                login(request, user)
                msg = "User login successfully"
                return redirect('admindashboard')
            else:
                msg = "Invalid Credentials 1"
        except:
            msg = "mot de pass incorrecte ou utilisateur inexestant"
    dic = {'msg': msg}
    return render(request, 'admin_login.html', dic)
def adminHome(request):
    return render(request, 'admin_base.html')
def admin_dashboard(request):
    return render(request, 'admin_dashboard.html')


def add_category(request):
    if request.method == "POST":
        name = request.POST['name']
        Category.objects.create(name=name)
        messages.success(request, "vous avez ajoutez une categorie avec succés")
       
        return redirect('view_category')
    return render(request, 'add_category.html', locals())

def view_category(request):
    category = Category.objects.all()
    return render(request, 'view-catgory.html', locals())
def edit_category(request, pid):
    category = Category.objects.get(id=pid)
    if request.method == "POST":
        name = request.POST['name']
        category.name = name
        category.save()
        messages.success(request, "vous avez modifer la categorie avec succés")
    return render(request, 'edit_category.html', locals())
def delete_category(request, pid):
    category = Category.objects.get(id=pid)
    category.delete()
    return redirect('view_category')

    
def add_product(request):
    category = Category.objects.all()
    mesg=None
    if request.method == "POST":
        name = request.POST['name']
        price = request.POST['price']
        cat = request.POST['category']
        discount = request.POST['discount']
        desc = request.POST['desc']
        try:
            image = request.FILES['image']
        except:
            mesg='ajouter une image de produit'
        
        try:
            
            catobj = Category.objects.get(id=cat)
            Product.objects.create(name=name, price=price, discount=discount, category=catobj, description=desc, image=image)
            messages.success(request, "le produit est bien ajouté ")
        except:
            mesg='les champs ne sont pas valides'
    dic={'mesg':mesg}
    return render(request, 'add_product.html', locals())
def view_product(request):
    product = Product.objects.all()
    return render(request, 'view_product.html', locals())
def edit_product(request, pid):
    product = Product.objects.get(id=pid)
    category = Category.objects.all()
    if request.method == "POST":
        name = request.POST['name']
        price = request.POST['price']
        cat = request.POST['category']
        discount = request.POST['discount']
        desc = request.POST['desc']
        try:
            image = request.FILES['image']
            product.image = image
            product.save()
        except:
            pass
        catobj = Category.objects.get(id=cat)
        Product.objects.filter(id=pid).update(name=name, price=price, discount=discount, category=catobj, description=desc)
        messages.success(request, "Product Updated")
    return render(request, 'edit_product.html', locals())

def registration(request):
    if request.method == "POST":
        fname = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        password = request.POST['password']
        address = request.POST['address']
        mobile = request.POST['mobile']
        image = request.FILES['image']
        user = User.objects.create_user(username=email, first_name=fname, last_name=lname, email=email, password=password)
        UserProfile.objects.create(user=user, mobile=mobile, address=address, image=image)
        messages.success(request, "Registration Successful")
    return render(request, 'registration.html', locals())


from .models import Clients
def add_client(request):
    mesg=None
    if request.method == "POST":
        nom = request.POST['nom']
        prenom = request.POST['prenom']
        adresse = request.POST['adresse']
        contact = request.POST['contact']
        cin= request.POST['cin']
        
        try:
             image = request.FILES['image']
        
             Clients.objects.create(nom=nom, prenom=prenom, adresse=adresse, contact=contact, cin=cin, image=image,credit=0)
             messages.success(request, "Client ajouter ")
        except:
            mesg='touts les champs doivent etre remplis'
            dic={'mesg':mesg}

    return render(request, 'add_client.html', locals())

def view_client(request):
    clients = Clients.objects.all()
    return render(request, 'view_client.html', locals())

def edit_client(request, pid):
    client = Clients.objects.get(id=pid)
   
    if request.method == "POST":
        nom = request.POST['nom']
        prenom = request.POST['prenom']
        adresse = request.POST['adresse']
        contact = request.POST['contact']
        cin = request.POST['cin']
        try:
            image = request.FILES['image']
            client.image = image
            client.save()
            Clients.objects.filter(id=pid).update(nom=nom, prenom=prenom, adresse=adresse, contact=contact, cin=cin)
            messages.success(request, "client modofier")
        except:
            mesg='les champs ne sont pas valides'
            dic={'mesg':mesg}
        
        
    return render(request, 'edit-client.html', locals())

def delete_client(request, pid):
    client = Clients.objects.get(id=pid)
    client.delete()
    messages.success(request, "client supprimer")
    return redirect(view_client)

def delete_product(request, pid):
    product = Product.objects.get(id=pid)
    product.delete()
    messages.success(request, "Product Deleted")
    return redirect('view_product')

def delete_category(request, pid):
    category = Category.objects.get(id=pid)
    category.delete()
    return redirect('view_category')

from .models import Product


def add_credit(request):
    mesg=None
    client = Clients.objects.all()
    if request.method == "POST":
        
        client = request.POST['client']
        montant = request.POST['montant']
        durée=0
        try:
            clientt = Clients.objects.get(id=client)
            Clients.objects.filter(id=client).update(credit=montant)
            if Credits.objects.filter(client_id=client).exists():
                cre=Credits.objects.get(client_id=client)

            
                montant=float(montant)+float(cre.montant)
                Credits.objects.filter(client_id=client).update( montant=montant,etat_credit="credit non reglé ")
            
            
            else:
                Credits.objects.create(client=clientt,montant=montant, durée=durée)
                messages.success(request, "Credit Ajouté")
        except:
            mesg='les champs ne sont pas valides'
    dic={'mesg':mesg}
    return render(request, 'add_credit.html', locals())

def view_credit(request):
    credit= Credits.objects.all()
    return render(request, 'view_credit.html', locals())
def duree(date1,date2):
        delta = date1 - date2
        return delta.days

def edit_credit(request, pid):
    mesg=None
    credits = Credits.objects.get(id=pid)
    clients = Clients.objects.all()
    if request.method == "POST":
        payer = request.POST['payer']
       # montant = request.POST['montant']
        nom = credits.client.nom
        try:
            if  payer=="montant à régler":
                payer=0
        
            montant=float(credits.montant)-float(payer)
            durée=duree(credits.updated,credits.created)
            if montant ==float(0):
                Credits.objects.filter(id=pid).update( etat_credit=" credit reglé")
                Clients.objects.filter(nom=nom).update(credit=montant)
           
                Credits.objects.filter(id=pid).update( montant=montant, durée=durée)
                return redirect(view_credit)
            elif montant > float(0) :
                Clients.objects.filter(nom=nom).update(credit=montant)
                
                Credits.objects.filter(id=pid).update( montant=montant,etat_credit="credit non reglé ",durée=durée)
                messages.success(request, "Credit mets ajour")
                return redirect(view_credit)


        #clt = request.POST['category']
        
        
        except:
            mesg="les champs ne sont pas valides"
    dic={'mesg':mesg}

       
    return render(request, 'edit_credit.html', locals())
def delete_credits(request, pid):
    credits = Credits.objects.get(id=pid)
    credits.delete()
    messages.success(request, "Credits supprimer")
    return redirect(view_credit)
    