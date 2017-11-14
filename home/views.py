from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse_lazy
from django.contrib.auth import authenticate
from django.contrib.auth import login as login_django
from django.contrib.auth import logout as logout_django
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from django.shortcuts import render
from django.shortcuts import redirect
from django.shortcuts import get_object_or_404
from django.views.generic import CreateView
from django.core.urlresolvers import reverse_lazy
from django.db.models import Q

from .forms import *

from .models import Question
from .models import Specie
from .models import ImageQuestion

from users.models import User
from django.core.mail import send_mail
# Django static files
from django.contrib.staticfiles.templatetags.staticfiles import static

import django_filters
# Email libraries
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders



def index(request):
    if request.user.is_authenticated():
        return redirect('home:usuario')

    template = 'index.html'
    message = None
    articles = Question.objects.all()
    page = request.GET.get('page', 1)
    paginator = Paginator(articles, 6)
    try:
        articles = paginator.page(page)
    except PageNotAnInteger:
        articles = paginator.page(1)
    except EmptyPage:
        articles = paginator.page(paginator.num_pages)

    f = SpecieFilter(request.GET, queryset=articles)

    login_form = LogInForm(request.POST or None)

    if request.method == 'POST':
        user_log = request.POST['Usuario']
        pass_log = request.POST['Contraseña']
        user_auth = authenticate(username=user_log, password=pass_log)

        if user_auth is not None:
            login_django(request, user_auth)
            return redirect('home:usuario')
        else:
            message = "Usuario o contraseña incorrectos."

    context = {
        'title': "PetGurú - Inicio",
        'message': message,
        'articles': articles,
        'form': login_form,
        'filter': f,
    }
    return render(request, template, context)


def question(request, id=None):
    template = 'question.html'
    instance = get_object_or_404(Question, id=id)
    image = ImageQuestion.objects.filter(id_question=instance.id)
    context = {
        'CN': "listo esto funciona",
        'images': image,
        'titulo': instance.title,
        'instance': instance,
    }

    return render(request, template, context)


def us(request):
    template = 'nosotros.html'
    context = {
        'title': "PetGurú - Nosotros",
    }
    return render(request, template, context)


def rules(request):
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
        solved = Question.objects.filter(user_response=request.user.pk).order_by('-id')
        articles = Question.objects.all().order_by('-id')
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


        page = request.GET.get('page', 1)
        paginator = Paginator(articles, 6)
        try:
            articles = paginator.page(page)
        except PageNotAnInteger:
            articles = paginator.page(1)
        except EmptyPage:
            articles = paginator.page(paginator.num_pages)

        if request.method == 'POST':
            if base_form.is_valid() and cow_form.is_valid():
                base = base_form.save(commit=False)
                cow = cow_form.save(commit=False)
                base.user_question = request.user
                base.save()
                cow.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+cow.get_specie_display()+'\n Raza: '+cow.race+\
                        '\n Edad: '+str(cow.age)+'\n Género: '+str(cow.gender)+'\n Peso: '+str(cow.weight)+\
                        '\n Frecuencia cardiaca: '+str(cow.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(cow.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(cow.temperature)+' °C'+'\n Tiempo de llenado capilar: '+str(cow.capilar)+' segundos'+\
                        '\n Color de mucosas: '+cow.mucosal_color+'\n Linfonodos: '+cow.lymph_nodes+'\n Movimientos ruminales: '+cow.ruminal+\
                        '\n Condición corporal: '+cow.body_condition
                cow.save()
                cowmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and porcine_form.is_valid():
                base = base_form.save(commit=False)
                pig = porcine_form.save(commit=False)
                base.user_question = request.user
                base.save()
                pig.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+pig.get_specie_display()+'\n Raza: '+pig.race+\
                        '\n Edad: '+str(pig.age)+'\n Género: '+str(pig.gender)+'\n Peso: '+str(pig.weight)+\
                        '\n Etapa fisiológica: '+pig.physiological_stage+'\n Sistema de producción: '+pig.production_system+\
                        '\n Curso del padecimiento en días: '+pig.curse+\
                        '\n Frecuencia cardiaca: '+str(pig.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(pig.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(pig.temperature)+' °C'+'\n Color de mucosas: '+pig.color+'\n Actitud: '+pig.attitude+\
                        '\n Condición corporal: '+pig.body_condition
                pig.save()
                pigmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and horse_form.is_valid():
                base = base_form.save(commit=False)
                horse = horse_form.save(commit=False)
                base.user_question = request.user
                base.save()
                horse.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+horse.get_specie_display()+'\n Raza: '+horse.race+\
                        '\n Edad: '+str(horse.age)+'\n Género: '+str(horse.gender)+'\n Peso: '+str(horse.weight)+\
                        '\n Frecuencia cardiaca: '+str(horse.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(horse.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(horse.temperature)+' °C'+'\n Tiempo de llenado capilar: '+str(horse.capilar)+' segundos'+\
                        '\n Color de mucosas: '+horse.mucosal_color+'\n Linfonodos: '+horse.lymph_nodes+\
                        '\n Condición corporal: '+horse.body_condition
                horse.save()
                horsemail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and ovine_form.is_valid():
                base = base_form.save(commit=False)
                ovine = ovine_form.save(commit=False)
                base.user_question = request.user
                base.save()
                ovine.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+ovine.get_specie_display()+'\n Raza: '+ovine.race+\
                        '\n Edad: '+str(ovine.age)+'\n Género: '+str(ovine.gender)+'\n Peso: '+str(ovine.weight)+\
                        '\n Etapa fisiológica: '+ovine.physiological_stage+'\n Sistema de producción: '+ovine.production_system+\
                        '\n Fin zootécnico: '+ovine.zootechnical+\
                        '\n Frecuencia cardiaca: '+str(ovine.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(ovine.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(ovine.temperature)+' °C'+'\n Color de mucosas: '+ovine.mucosal_color+'\n Movimientos ruminales: '+ovine.ruminal+\
                        '\n Condición corporal: '+ovine.body_condition
                ovine.save()
                ovinemail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and goat_form.is_valid():
                base = base_form.save(commit=False)
                goat = goat_form.save(commit=False)
                base.user_question = request.user
                base.save()
                goat.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+goat.get_specie_display()+'\n Raza: '+goat.race+\
                        '\n Edad: '+str(goat.age)+'\n Género: '+str(goat.gender)+'\n Peso: '+str(goat.weight)+\
                        '\n Etapa fisiológica: '+goat.physiological_stage+'\n Sistema de producción: '+goat.production_system+\
                        '\n Fin zootécnico: '+goat.zootechnical+'\n Tiempo de llenado capilar'+goat.capilar+\
                        '\n Frecuencia cardiaca: '+str(goat.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(goat.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(goat.temperature)+' °C'+'\n Color de mucosas: '+goat.mucosal_color+'\n Movimientos ruminales: '+goat.ruminal+\
                        '\n Linfonodos: '+goat.lymph_nodes+'\n Reflejo tusígeno: '+goat.cough+'\n Condición corporal: '+goat.body_condition
                goat.save()
                goatmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and rabbit_form.is_valid():
                base = base_form.save(commit=False)
                rab = rabbit_form.save(commit=False)
                base.user_question = request.user
                base.save()
                rab.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+rab.get_specie_display()+'\n Raza: '+rab.race+\
                        '\n Edad: '+str(rab.age)+'\n Género: '+str(rab.gender)+'\n Peso: '+str(rab.weight)+\
                        '\n Etapa productiva: '+rab.productive_stage+'\n Frecuencia cardiaca: '+str(rab.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(rab.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(rab.temperature)+' °C'+'\n Color de mucosas: '+rab.color+'\n Ganglios linfáticos: '+rab.lymph_nodes+\
                        '\n Tiempo de llenado capilar: '+rab.capilar+'\n Deshidratación: '+rab.dehydration+'\n Condición corporal: '+rab.body_condition
                rab.save()
                rabbitmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and bird_form.is_valid():
                base = base_form.save(commit=False)
                bird = bird_form.save(commit=False)
                base.user_question = request.user
                base.save()
                bird.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Tipo de animal: '+bird.type_animal+'\n Fin zootécnico: '+bird.zootechnical_purpose+\
                        '\n Edad: '+bird.age+'\n Edad en semanas: '+str(bird.age_week)+'\n Edad en meses: '+str(bird.age_month)+\
                        '\n Lugar de encierro: '+bird.place+'\n Cantidad de animales: '+str(bird.quantity)+\
                        '\n Origen del agua: '+bird.origin_water+'\n Morbilidad: '+str(bird.morbidity)+'\n Mortalidad: '+str(bird.mortality)+'\n Fecha de inicio de los signos: '+str(bird.date_signs)+\
                        '\n Consumo de agua: '+bird.water+'\n Consumo de alimento: '+bird.eat+'\n Calendario de vacunaciones: '+bird.vaccine+\
                        '\n Defecación: '+bird.defecation+'\n Condición corporal: '+bird.condition_corporal+'\n Condición del plumaje: '+bird.plumage+\
                        '\n Condición de las patas: '+bird.condition_legs+'\n Frecuencia respiratoria: '+str(bird.breathing_frequency)+\
                        '\n Actitud: '+bird.attitude
                bird.save()
                birdmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and dog_form.is_valid():
                base = base_form.save(commit=False)
                dog = dog_form.save(commit=False)
                base.user_question = request.user
                base.save()
                dog.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+dog.get_specie_display()+'\n Raza: '+dog.race+\
                        '\n Edad: '+str(dog.age)+'\n Género: '+str(dog.gender)+'\n Peso: '+str(dog.weight)+\
                        '\n Frecuencia cardiaca: '+str(dog.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(dog.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(dog.temperature)+' °C'+'\n Tiempo de llenado capilar: '+str(dog.capilar)+'\n Color de mucosas: '+dog.mucosal_color+'\n Reflejo tusígeno: '+dog.cough+\
                        '\n Pulso correspondiente: '+dog.pulse+'\n Lesiones en piel: '+dog.skin
                dog.save()
                dogmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and cat_form.is_valid():
                base = base_form.save(commit=False)
                cat = cat_form.save(commit=False)
                base.user_question = request.user
                base.save()
                cat.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+cat.get_specie_display()+'\n Raza: '+cat.race+\
                        '\n Edad: '+str(cat.age)+'\n Género: '+str(cat.gender)+'\n Peso: '+str(cat.weight)+\
                        '\n Frecuencia cardiaca: '+str(cat.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(cat.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(cat.temperature)+' °C'+'\n Tiempo de llenado capilar: '+str(cat.capilar)+'\n Color de mucosas: '+cat.mucosal_color+'\n Reflejo tusígeno: '+cat.cough+\
                        '\n Pulso correspondiente: '+cat.pulse+'\n Lesiones en piel: '+cat.skin
                cat.save()
                catmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and wild_form.is_valid():
                base = base_form.save(commit=False)
                wild = wild_form.save(commit=False)
                base.user_question = request.user
                base.save()
                wild.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+wild.specie+'\n Fin zootécnico: '+wild.zootechnical+\
                        '\n Condiciones Medio-Ambientales: '+wild.ambiental_condition+'\n Alimentación: '+wild.feeding+'\n Antecedentes patológicos/hereditarios: '+wild.background+\
                        '\n Evolución de la enfermedad actual: '+wild.evolution_disease+'\n Frecuencia cardiaca: '+str(wild.heart_rate)+' lpm'+'\n Frecuencia respiratoria: '+str(wild.respiratory_rate)+\
                        ' rpm'+'\n Temperatura: '+str(wild.temperature)+' °C'+'\n Tiempo de llenado capilar: '+str(wild.capilar)+'\n Coloración de mucosas: '+wild.mucosal_color+'\n Linfonodos: '+wild.lymph_nodes+\
                        '\n Movimientos ruminales: '+wild.ruminal
                wild.save()
                wildmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and aquatic_form.is_valid():
                base = base_form.save(commit=False)
                aq = aquatic_form.save(commit=False)
                base.user_question = request.user
                base.save()
                aq.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Grupo genético: '+aq.genetic+'\n Fin zootécnico: '+aq.zootechnical+\
                        '\n Edad: '+str(aq.age)+'\n Peso promedio de la polacion: '+str(aq.weight)+'\n Tipo de estanque: '+aq.pond+\
                        '\n Densidad: '+str(aq.density)
                        # '\n Biomasa: '+str(aq.biomass)+'\n Presencia de sistema de aireación: '+aq.aeration+\
                        # '\n Tipo de aireador: '+aq.recirculation_water+'\n Presencia de sistema de recirculación de agua: '+str(aq.recirculation_water)+\
                        # '\n Recambio diario de agua: '+str(aq.change_water)+'\n Fecha de siembra: '+aq.date_sowing+'\n Temperatura (6 am): '+str(aq.temperature_6am)+\
                        # '\n Temperatura 3 pm): '+str(aq.temperature_3pm)+'\n Oxígeno disuelto en agua (6 am): '+str(aq.oxygen_6am)+'\n Oxígeno disuelto en agua (3 pm): '+str(aq.oxygen_3pm)+\
                        # '\n pH (6 am): '+str(aq.ph_6am)+'\n pH (3 pm): '+str(aq.ph_3pm)+'\n Nitritos (NO2): '+str(aq.no2)+'\n Amonio (NH4): '+str(aq.nh4)+'\n Amoniaco (NH3): '+str(aq.nh3)+\
                        # '\n Transparencia: '+str(aq.transparency)+'\n Mortalidad acumulada: '+str(aq.mortality)+'\n Inicio de la mortandad: '+aq.start_mortality+'\n Posición de los peces en la columna de agua: '+aq.position+'\n Coloración del cuerpo de los peces: '+aq.body_color+\
                        # '\n Tipo de movimiento de los peces en el agua: '+aq.moves+'\n Inapetencia: '+aq.lack_of_appetite+'\n Tipo de alimentación: '+aq.type_eat+'\n Cantidad de alimento administrado por día: '+aq.eat_for_day+'\n Coloración: '+aq.coloration+\
                        # '\n Vientre abultado: '+aq.bulging_belly+'\n Exoftalmia: '+aq.exophthalmia+'\n Petequias en base de aletas: '+aq.petechia+'\n Aletas desilachadas: '+aq.dilated+'\n Úlceras: '+aq.ulcers+\
                        # '\n Llagas en piel: '+aq.skin_sores+'\n Estructuras algodonosas: '+aq.cotton_structures+'\n Necrosis en capa epidérmica: '+aq.necrosis_epidermal_layer+'\n Opacidad ocular: '+aq.ocular_opacity
                aq.save()
                fishmail(request, message)
                return redirect ('home:usuario')
            elif base_form.is_valid() and bee_form.is_valid():
                base = base_form.save(commit=False)
                bee = bee_form.save(commit=False)
                base.user_question = request.user
                base.save()
                bee.question = base
                message = 'Pregunta: '+base.title+'\n consula: '+base.description+\
                        '\n\n\n Especie: '+bee.specie+'\n Tipo de colonia: '+bee.colony_type+\
                        '\n Revisión de colmena: '+bee.hive_review+'\n Presencia de la reina: '+bee.queen_presence+'\n Cría: '+bee.breeding+\
                        '\n Abeja adulta: '+bee.adult_bee+'\n Número de bastidores cubiertos por abejas en la cámara de cría y en las alzas: '+str(bee.backstage_bee)+'\n Presencia de celdas reales: '+bee.real_cell+\
                        '\n Número de bastidores cubiertos por cría: '+str(bee.backstage_breeding)+\
                        '\n Cantidad de huevos por celda: '+str(bee.quantity_eggs)+'\n Observación de características anormales en la entrada de la colmena: '+bee.observations+\
                        '\n Manchas de heces: '+bee.stool_spots+'\n Pedazos de larvas o larvas completas: '+bee.piece_larvae+\
                        '\n Presencia de abejas muertas al frente de la piquera: '+bee.dead_bees+'\n Presencia de alimento en bastidores: '+bee.food_racks+'\nNúmero de bastidores con miel, polen o néctar: '+str(bee.number_racks)
                        # '\n Presencia de huevos: '+bee.eggs+\
                bee.save()
                beemail(request, message)
                return redirect ('home:usuario')

        context = {
            'title': "Bienvenido "+request.user.username,
            'solveds': solved,
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
        solved = Question.objects.filter(user_response=request.user.pk).filter(Q(status='OP') | Q(status='RP')).order_by('-id')
        article = Question.objects.filter(status='CL').order_by('-id')
        avg = 0

        page = request.GET.get('page', 1)
        paginator = Paginator(solved, 6)
        try:
            solved = paginator.page(page)
        except PageNotAnInteger:
            solved = paginator.page(1)
        except EmptyPage:
            solved = paginator.page(paginator.num_pages)

        qualifications = []
        for qualification in article:
            qualifications.append(qualification.calification)
            if qualifications != 0:
                avg = sum(qualifications) / len(qualifications)
            else:
                avg = 0
        context = {
            'title': "Profesional " + request.user.username,
            'solveds': solved,
            'articles': article,
            'avg': avg,
        }
        return render(request, template, context)

    elif request.user.rol == 'AD':
        return redirect('home:register')


@login_required(login_url='home:inicio')
def register(request):
    if request.user.rol == 'AD':
        template = "user_register.html"
        f = RegisterForm()
        messages = None
        context = {
            'title': 'Registro de usuarios',
            'form': f,
        }
        if request.method == 'POST':
            f = RegisterForm(request.POST)
            if f.is_valid():
                f.save()
                messages='Usuario creado correctamente'
                return redirect('home:register')
    else:
        return redirect('home:inicio')

    return render(request, template, context)



class SpecieFilter(django_filters.FilterSet):
    class Meta():
        model = Specie
        fields = ['specie']


def search(request, id):
    id = int(id)
    message = None
    if id == 1:
        articles = Bovine.objects.all()
    elif id == 2:
        articles = Goat.objects.all()
    elif id == 3:
        articles = Rabbit.objects.all()
    elif id == 4:
        articles = Horse.objects.all()
    elif id == 5:
        articles = Dog.objects.all()
    elif id == 6:
        articles = Cat.objects.all()
    elif id == 7:
        articles = Porcine.objects.all()
    elif id == 8:
        articles = Bee.objects.all()
    elif id == 9:
        articles = Bird.objects.all()
    elif id == 10:
        articles = Wild.objects.all()
    elif id == 11:
        articles = Aquatic.objects.all()
    else:
        redirect('home:inicio')

    login_form = LogInForm(request.POST or None)

    if request.method == 'POST':
        user_log = request.POST['Usuario']
        pass_log = request.POST['Contraseña']
        user_auth = authenticate(username=user_log, password=pass_log)

        if user_auth is not None:
            login_django(request, user_auth)
            return redirect('home:usuario')
        else:
            message = "Usuario o contraseña incorrectos."

    context = {
        'title': "PetGurú - Inicio",
        'message': message,
        'articles': articles,
        'form': login_form,
    }
    return render(request, 'article.html', context)


def cowmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def pigmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "jonathanbasilio24@outlook.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def horsemail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def ovinemail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def goatmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def rabbitmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def birdmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def dogmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def catmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def wildmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def fishmail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None


def beemail (request, message):
    fromaddr = "itzli2000@gmail.com"
    toaddr = "itzli2000@msn.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."

    body = message
    msg.attach(MIMEText(body, 'plain'))
 
    # filename = "main.jpg"
    # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

    # part = MIMEBase('application', 'octet-stream')
    # part.set_payload((attachment).read())
    # encoders.encode_base64(part)
    # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
     
    # msg.attach(part)

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "molinona&9")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()

    return None