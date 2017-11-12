from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate
from django.contrib.auth import login as login_django
from django.contrib.auth import logout as logout_django
from django.http import JsonResponse, HttpResponse
from django.views.generic import CreateView

from django.http import HttpResponse
from .models import Question, ImageQuestion
from .forms import Login, BaseForm, CowForm, PorcineForm, HorseForm, GoatForm, OvineForm
from .forms import RabbitForm, BirdForm, DogForm, CatForm, WildForm, AquaticForm, BeeForm
# Create your views here.


def index(request):
    if request.user.is_authenticated():
        return redirect('home:usuario')

    template = 'index.html'
    message = None
    articles = Question.objects.all()
    print(articles)
    Login_form = Login(request.POST or None)
    
    if request.method == 'POST':
        userLog = request.POST['usuario']
        passLog = request.POST['contraseña']
        user = authenticate( username = userLog , password = passLog)
        if user is not None:
            login_django(request, user)
            return redirect('home:usuario')
        else:
            message = "Usuario o contraseña incorrectos."

    context = {
        'title': "PetGurú - Inicio",
        'message' : message,
        'articles':articles,
        'form' : Login_form,
    }
    return render(request, template, context)


def pregunta(request, id=None):
    template = 'question.html'
    instance = get_object_or_404(Question, id=id)
    image = ImageQuestion.objects.filter(id_question=instance.id)
    context = {
        'images': image,
        'titulo': instance.title,
        'instance': instance,
    }

    return render(request, template, context)


def nosotros(request):
    template = 'nosotros.html'
    context = {
        'title': "PetGurú - Nosotros",
    }
    return render(request, template, context)


def reglamento(request):
    template = 'reglamento.html'
    context = {
        'title': "PetGurú - Reglamento",
    }
    return render(request, template, context)


@login_required(login_url='home:inicio')
def logout(request):
    logout_django(request)
    return redirect('home:inicio')


@login_required(login_url='home:inicio')
def user(request):
    if request.user.rol == 'ST':
        template = 'user.html'
        Mineposts = Question.objects.filter(user_question=request.user.pk)
        Mineposts_act = Question.objects.filter(user_question=request.user.pk,status='OP')
        articles = Question.objects.all()

        base_form = BaseForm(request.POST or None)
        cow_form = CowForm(request.POST or None)
        porcine_form = PorcineForm(request.POST or None)
        horse_form = HorseForm(request.POST or None)
        goat_form = GoatForm(request.POST or None)
        ovine_form = OvineForm(request.POST or None)
        rabbit_form = RabbitForm(request.POST or None)
        bird_form = BirdForm(request.POST or None)
        dog_form = DogForm(request.POST or None)
        cat_form = CatForm(request.POST or None)
        wild_form = WildForm(request.POST or None)
        aquatic_form = AquaticForm(request.POST or None)
        bee_form = BeeForm(request.POST or None)


        if request.method == 'POST':
            if base_form.is_valid():
                print(base_form)
                base_form.save()
                if cow_form.is_valid():
                    print(cow_form)
                    cow_form.save()
                    return redirect ('home:usuario')

        context = {
            'title': "Bienvenido "+request.user.username,
            'mineposts': Mineposts,
            'mineposts_act': Mineposts_act,
            'articles':articles,
            'baseForm': base_form,
            'cow_form': cow_form,
            'porcine_form': porcine_form,
            'horse_form': horse_form,
            'goat_form': goat_form,
            'ovine_form': ovine_form,
            'rabbit_form': rabbit_form,
            'bird_form': bird_form,
            'dog_form': dog_form,
            'cat_form': cat_form,
            'wild_form': wild_form,
            'aquatic_form': aquatic_form,
            'bee_form': bee_form,
        }

        return render(request, template, context)
    elif request.user.rol == 'TC':
        template = 'prof.html'
        if request.method == 'POST':
            if base_form.is_valid():
                print(base_form)
                base_form.save()
                if cow_form.is_valid():
                    print(cow_form)
                    cow_form.save()
                    return redirect('home:usuario')
        solved = Question.objects.filter(user_response=request.user.pk).filter(status='CL')
        article = Question.objects.filter(status='OP')
        context = {
            'title': "Profesional " + request.user.username,
            'solveds': solved,
            'articles': article,
        }

        return render(request, template, context)
    elif request.user.rol == 'AD':
        return redirect('admin:login')
