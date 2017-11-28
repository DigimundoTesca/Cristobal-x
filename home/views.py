from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate
from django.contrib.auth import login as login_django
from django.contrib.auth import logout as logout_django
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.forms import modelformset_factory
from django.shortcuts import render
from django.shortcuts import redirect
from django.shortcuts import get_object_or_404
from django.db.models import Q
from django.contrib.sites.shortcuts import get_current_site

from .forms import *

from .models import Question
from .models import Specie
from .models import ImageQuestion

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template
from django.template import Context


def index(request):
    if request.user.is_authenticated():
        return redirect('home:usuario')

    template = 'index.html'
    message = None
    articles = Question.objects.filter(Q(status='CL')).order_by('-id')
    page = request.GET.get('page', 1)
    paginator = Paginator(articles, 6)

    try:
        articles = paginator.page(page)

    except PageNotAnInteger:
        articles = paginator.page(1)

    except EmptyPage:
        articles = paginator.page(paginator.num_pages)
    login_form = LogInForm(request.POST or None)

    if request.method == 'POST':
        user_log = request.POST['Usuario']
        pass_log = request.POST['Contraseña']        
        user_auth = authenticate(request,username=user_log, password=pass_log)

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
        'filter': filter,
    }

    return render(request, template, context)


def question(request, id=None):
    template = 'question.html'
    instance = get_object_or_404(Question, id=id)
    image = ImageQuestion.objects.filter(question=instance.id)
    messages = reversed(instance.messages.order_by('-timestamp')[:50])
    label = id;

    if request.method == 'POST':                
        message = request.POST.get('message')        
        handler = request.POST.get('handler')
        new_mess = Message.objects.create(question=instance,handle=handler,message=message)
        new_mess.save()

    context = {        
        'label': label,
        'images': image,
        'titulo': instance.title,
        'instance': instance,
        'messages': messages,
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
        solved = Question.objects.filter(user_question=request.user.pk).order_by('-id')
        articles = Question.objects.all().order_by('-id')

        ImageFormSet = modelformset_factory(ImageQuestion, form=ImageQuestionForm, extra=3)

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
            formset = ImageFormSet(request.POST, request.FILES, queryset=ImageQuestion.objects.none())            

            def save_images(base):
                # Save images
                for form in formset.cleaned_data:
                    image = form['image']
                    photo = ImageQuestion(question=base, image=image)
                    photo.save()

            if base_form.is_valid() and formset.is_valid():
                if cow_form.is_valid():
                    base = base_form.save(commit=False)
                    cow = cow_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    cow.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    cow.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='BV').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif porcine_form.is_valid():
                    base = base_form.save(commit=False)
                    pig = porcine_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    pig.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    pig.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='PR').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif horse_form.is_valid():
                    base = base_form.save(commit=False)
                    horse = horse_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    horse.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    horse.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='EQ').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif ovine_form.is_valid():
                    base = base_form.save(commit=False)
                    ovine = ovine_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    ovine.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    ovine.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='OV').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif goat_form.is_valid():
                    base = base_form.save(commit=False)
                    goat = goat_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    goat.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    goat.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='CP').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)
                    return redirect('home:usuario')

                elif rabbit_form.is_valid():
                    base = base_form.save(commit=False)
                    rab = rabbit_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    rab.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    rab.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='LP').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif bird_form.is_valid():
                    base = base_form.save(commit=False)
                    bird = bird_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    bird.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    bird.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='AV').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif dog_form.is_valid():
                    base = base_form.save(commit=False)
                    dog = dog_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    dog.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    dog.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='CN').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif cat_form.is_valid():
                    base = base_form.save(commit=False)
                    cat = cat_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    cat.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    cat.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='FL').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif wild_form.is_valid():
                    base = base_form.save(commit=False)
                    wild = wild_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    wild.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    wild.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='SL').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            wildmail(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif aquatic_form.is_valid():
                    base = base_form.save(commit=False)
                    aq = aquatic_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    aq.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    aq.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='AQ').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif bee_form.is_valid():
                    base = base_form.save(commit=False)
                    bee = bee_form.save(commit=False)
                    base.user_question = request.user
                    base.save()
                    bee.question = base
                    new_context = {
                    'title': base.title,
                    'consult': base.description,
                    'url': get_current_site(request).domain,
                    }
                    template = get_template('mail.html')
                    html_content = template.render(new_context)
                    bee.save()
                    save_images(base)
                    emails = User.objects.filter(speciality='BJ').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')
            else:
                print('base_form errors: ', base_form.errors)
                print('formst errors: ', formset.errors)

        formset = ImageFormSet(queryset=ImageQuestion.objects.none())
        context = {
            'title': "Bienvenido "+request.user.username,
            'solveds': solved,
            'articles': articles,
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
            'formset': formset,
        }
        return render(request, template, context)

    elif request.user.rol == 'TC':
        template = 'prof.html'
        solved = Question.objects.filter(Q(status='OP') | Q(status='RP')).order_by('-id')
        article = Question.objects.filter(status='OP').order_by('-id')
        avg = 0        
        page = request.GET.get('page', 1)
        paginator = Paginator(solved, 6)
        try:
            solved = paginator.page(page)
        except PageNotAnInteger:
            solved = paginator.page(1)
        except EmptyPage:
            solved = paginator.page(paginator.num_pages)

        if request.method == 'POST':                 
            if request.POST['type'] == 'changestate':
                pk = request.POST['pk']
                change = Question.objects.get(pk=pk);
                change.status = 'RP'
                change.user_response = request.user
                change.save();

        # qualifications = []
        # for qualification in article:
        #     qualifications.append(qualification.calification)
        #     if qualifications != 0:
        #         avg = sum(qualifications) / len(qualifications)
        #     else:
        avg = 3
        
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
def cards(request):
    if request.user.rol == 'ST':
        template = 'cards.html'
        articles = Question.objects.filter(user_question=request.user.pk).order_by('-id')

        page = request.GET.get('page', 1)
        paginator = Paginator(articles, 6)
        try:
            articles = paginator.page(page)
        except PageNotAnInteger:
            articles = paginator.page(1)
        except EmptyPage:
            articles = paginator.page(paginator.num_pages)

        context = {
            'title': "Bienvenido "+request.user.username,
            'articles': articles,
        }
        return render(request, template, context)

    elif request.user.rol == 'TC':
        template = 'cards.html'
        article = Question.objects.filter(Q(status='OP') | Q(status='RP')).order_by('-id')
        page = request.GET.get('page', 1)
        paginator = Paginator(article, 6)
        try:
            article = paginator.page(page)
        except PageNotAnInteger:
            article = paginator.page(1)
        except EmptyPage:
            article = paginator.page(paginator.num_pages)
        
        context = {
            'title': "Profesional " + request.user.username,
            'articles': article,
        }
        return render(request, template, context)

    elif request.user.rol == 'AD':
        return redirect('home:register')



@login_required(login_url='home:inicio')
def register(request):
    # if request.user.rol == 'AD':
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
    # else:
    #     return redirect('home:inicio')

        return render(request, template, context)


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


def sendmailform(request, email_user, html_content):
    fromaddr = "itzli2000@gmail.com"
    toaddr = email_user
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "Se ha generado una nueva pregunta en el grupo del cual usted es especialista."
    

    body = html_content

    msg.attach(MIMEText(body, 'html'))
 
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




def mail(request):
    template = 'mail.html'
    context = {
        'title': "PetGurú - mail",
    }
    return render(request, template, context)