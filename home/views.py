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
from django.http import HttpResponseRedirect
from .forms import *
from django.utils.datastructures import MultiValueDictKeyError
from .models import Question
from .models import Specie
from .models import ImageQuestion
from .models import Document

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
from smtplib import SMTPRecipientsRefused
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
        user_auth = authenticate(request,username=user_log,password=pass_log)

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



@login_required(login_url='home:inicio')
def question(request, id=None):
    template = 'question.html'
    instance = get_object_or_404(Question, id=id)
    image = ImageQuestion.objects.filter(question=instance.id)
    messages = reversed(instance.messages.order_by('-timestamp')[:50])
    label = id
    objspecie = instance.get_obj_specie()
    document = Document.objects.filter(question=instance.id)
    values = translate(objspecie)
    dic = dict(zip(objspecie.FIELDS, values))
    formMessage = MessageForm()

    def send_comment(handler, message):
        if handler == instance.user_question.username:
            new_context = {
                'title': instance.title,
                'consult': message,
                'url': get_current_site(request).domain,
            }
            template = get_template('profesormail.html')
            html_content = template.render(new_context)
            emails = instance.user_response.email
            sendprofmail(request, emails, html_content)
        else:
            new_context = {
                'title': instance.title,
                'consult': message,
                'url': get_current_site(request).domain,
            }
            template = get_template('studentmail.html')
            html_content = template.render(new_context)
            emails = instance.user_question.email
            sendstudentmail(request, emails, html_content)
        return None

    if request.method == 'POST':

        if 'type' in request.POST:
            if request.POST['type'] == 'changestate':
                if instance.status == 'OP':
                    pk = request.POST['pk']
                    change = Question.objects.get(pk=pk)
                    change.status = 'RP'
                    change.user_response = request.user
                    change.save()
                else:
                    return redirect('home:usuario')

        form = MessageForm(request.POST, request.FILES)
        if form.is_valid():
            new_message = Message.objects.create(
                question=instance,
                handle=request.user.username,
                message=request.POST['message'],
                image=None,
                document=None)
            send_comment(new_message.handle, new_message.message)
            if len(request.FILES) != 0:
                if 'image' in request.FILES:
                    new_message.image = request.FILES['image']
                    new_message.save()
                if 'document' in request.FILES:
                    new_message.document = request.FILES['document']
                    new_message.save()
        else:
            calif = request.POST.get('calif')
            stat = request.POST.get('changeto')
            if stat == 'CL':
                instance.calification = calif
                instance.status = stat
                new_context = {
                'title': instance.title,
                'consult': 'La pregunta se ha cerrado',
                'url': get_current_site(request).domain,
                }
                template = get_template('closequestion.html')
                html_content = template.render(new_context)
                emails = instance.user_response.email
                sendclosemail(request, emails, html_content)
                instance.save()
        return HttpResponseRedirect('/pregunta/'+id)


    context = {
        'formMessage': formMessage,
        'label': label,
        'images': image,
        'titulo': instance.title,
        'instance': instance,
        'messages': messages,
        'specie': objspecie,
        'document': document,
        'values': dic,
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


def tuto(request):
    template = 'tutorial.html'
    context = {
        'title': "PetGurú - tutorial",
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
        articles = Question.objects.filter(Q(status='CL')).order_by('-id')
        ImageFormSet = modelformset_factory(ImageQuestion, form=ImageQuestionForm, extra=1)
        document_form = modelformset_factory(Document, form=DocumentForm, extra=1)
        # document_form = DocumentForm(request.POST, request.FILES)

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
            docset = document_form(request.POST, request.FILES, queryset=Document.objects.none())

            def save_images(base):
                # Save images
                if formset.is_valid():
                    for form in formset.cleaned_data:
                        if form:
                            image = form['image']
                            photo = ImageQuestion(question=base, image=image)
                            photo.save()

            def save_documents(base):
                # Save documents
                if docset.is_valid():
                    for form in docset.cleaned_data:
                        if form:
                            document = form['document']
                            doc = Document(question=base, document=document)
                            doc.save()

            if base_form.is_valid():
                if cow_form.is_valid() and base_form.cleaned_data['specie'] == 'BV':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='BV').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif porcine_form.is_valid() and base_form.cleaned_data['specie'] == 'PR':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='PR').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif horse_form.is_valid() and base_form.cleaned_data['specie'] == 'EQ':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='EQ').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif ovine_form.is_valid() and base_form.cleaned_data['specie'] == 'OV':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='OV').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif goat_form.is_valid() and base_form.cleaned_data['specie'] == 'CP':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='CP').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)
                    return redirect('home:usuario')

                elif rabbit_form.is_valid() and base_form.cleaned_data['specie'] == 'LP':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='LP').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif bird_form.is_valid() and base_form.cleaned_data['specie'] == 'AV':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='AV').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif dog_form.is_valid() and base_form.cleaned_data['specie'] == 'CN':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='CN').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif cat_form.is_valid() and base_form.cleaned_data['specie'] == 'FL':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='FL').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif wild_form.is_valid() and base_form.cleaned_data['specie'] == 'SL':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='SL').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif aquatic_form.is_valid() and base_form.cleaned_data['specie'] == 'AQ':
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
                    save_documents(base)
                    save_images(base)
                    emails = User.objects.filter(speciality='AQ').filter(rol='TC')
                    try:
                        for user_speciality in emails:
                            sendmailform(request, user_speciality.email, html_content)
                    except Exception as e:
                        print('ERROR: ' + e.args)

                    return redirect('home:usuario')

                elif bee_form.is_valid() and base_form.cleaned_data['specie'] == 'BJ':
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
                    save_documents(base)
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
        docset = document_form(queryset=Document.objects.none())
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
            'docset': docset,
        }
        return render(request, template, context)

    elif request.user.rol == 'TC':
        template = 'prof.html'
        solved = Question.objects.filter(Q(status='OP') | Q(status='RP')).order_by('-id')
        article = Question.objects.filter(Q(status='CL')).order_by('-id')
        page = request.GET.get('page', 1)
        paginator = Paginator(solved, 6)
        try:
            solved = paginator.page(page)
        except PageNotAnInteger:
            solved = paginator.page(1)
        except EmptyPage:
            solved = paginator.page(paginator.num_pages)

        context = {
            'title': "Profesional " + request.user.username,
            'solveds': solved,
            'articles': article,
            'avg': get_avg(request.user),
        }
        return render(request, template, context)

    elif request.user.rol == 'AD':
        return redirect('home:register')


@login_required(login_url='home:inicio')
def cards(request):
    if request.user.rol == 'ST':
        template = 'cards.html'
        articles = Question.objects.filter(Q(status='CL')).order_by('-id')

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
        article = Question.objects.filter(Q(status='CL')).order_by('-id')
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
                if f.cleaned_data['rol'] == 'AD':
                    f.is_staff = True
                    f.is_superuser = True
                    f.save()
                    messages='Usuario creado correctamente'
                    return redirect('home:register')
                else:
                    f.save()
                    messages = 'Usuario creado correctamente'
                    return redirect('home:register')
        return render(request, template, context)
    else:
        return redirect('home:inicio')


def search(request, label): 
    message = None
    template = 'article.html'
    articles = Question.objects.filter(specie=label)

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
    return render(request, template, context)


def sendmailform(request, email_user, html_content):
    if email_user:
        fromaddr = "albeitarunam@gmail.com"
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
        server.login(fromaddr, "digimundounam")
        text = msg.as_string()
        server.sendmail(fromaddr, toaddr, text)
        server.quit()


def sendstudentmail(request, email_user, html_content):
    if email_user:
        fromaddr = "albeitarunam@gmail.com"
        toaddr = email_user
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "Tu pregunta ha sido respondida."
        body = html_content
        msg.attach(MIMEText(body, 'html'))
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(fromaddr, "digimundounam")
        text = msg.as_string()
        server.sendmail(fromaddr, toaddr, text)
        server.quit()


def sendprofmail(request, email_user, html_content):
    if email_user:
        fromaddr = "albeitarunam@gmail.com"
        toaddr = email_user
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "Se ha generado un comentario respecto a una de sus respuestas."
        body = html_content
        msg.attach(MIMEText(body, 'html'))
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(fromaddr, "digimundounam")
        text = msg.as_string()
        server.sendmail(fromaddr, toaddr, text)
        server.quit()


def sendclosemail(request, email_user, html_content):
    if email_user:
        fromaddr = "albeitarunam@gmail.com"
        toaddr = email_user
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "Se ha marcado como RESUELTA una de las preguntas que ayudó a resolver."
        body = html_content
        msg.attach(MIMEText(body, 'html'))
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(fromaddr, "digimundounam")
        text = msg.as_string()
        server.sendmail(fromaddr, toaddr, text)
        server.quit()


def mail(request):
    template = 'mail.html'
    context = {
        'title': "PetGurú - mail",
    }
    return render(request, template, context)


def get_avg(user):
    qualifications = []
    article = Question.objects.filter(user_response=user.pk)
    if article:
        for qualification in article:
            qualifications.append(qualification.calification)
        if qualifications != 0:
            avg = sum(qualifications) / len(qualifications)
            return avg
        else:
            return 0
    else:
        return 'Aun no tienes preguntas contestadas'


def translate(objspecie):
    values = []
    for trad in objspecie.get_fields():
        if trad[1] == 'ML':
            values.append('Macho')
        elif trad[1] == 'FM':
            values.append('Hembra')
        elif trad[1] == 'YS':
            values.append('Si')
        elif trad[1] == 'NO':
            values.append('No')
        elif trad[1] == 'LC':
            values.append('Lactante')
        elif trad[1] == 'PG':
            values.append('Gestante')
        elif trad[1] == 'IC':
            values.append('Crecimiento')
        elif trad[1] == 'FT':
            values.append('Engorda')
        elif trad[1] == 'RS':
            values.append('Rústica')
        elif trad[1] == 'WL':
            values.append('Silvestre')
        elif trad[1] == 'TC':
            values.append('Tecnificada Lamgstroth')
        elif trad[1] == 'JM':
            values.append('Tecnificada Jumbo')
        elif trad[1] == 'BC':
            values.append('Larvas de color normal')
        elif trad[1] == 'PR':
            values.append('Perforadas')
        elif trad[1] == 'FT':
            values.append('Aspecto grasoso')
        elif trad[1] == 'APR':
            values.append('Opérculos raídos')
        elif trad[1] == 'NV':
            values.append('No Verificado')
        elif trad[1] == 'ST':
            values.append('Abdomen distendido')
        elif trad[1] == 'SL':
            values.append('Lentas')
        elif trad[1] == 'CH':
            values.append('Pérdida del instinto de picar')
        elif trad[1] == 'LP':
            values.append('Alopécicas')
        elif trad[1] == 'SH':
            values.append('Brillosas')
        elif trad[1] == 'PS':
            values.append('Presente')
        elif trad[1] == 'NT':
            values.append('No presente')
        elif trad[1] == 'YN':
            values.append('Joven')
        elif trad[1] == 'DL':
            values.append('Adulto')
        elif trad[1] == 'CG':
            values.append('Jaula')
        elif trad[1] == 'FR':
            values.append('Libre')
        elif trad[1] == 'HH':
            values.append('Gallinero')
        elif trad[1] == 'CM':
            values.append('Compactas')
        elif trad[1] == 'LQ':
            values.append('Líquidas')
        elif trad[1] == 'GR':
            values.append('Verdes')
        elif trad[1] == 'WH':
            values.append('Blancas')
        elif trad[1] == 'TH':
            values.append('Otros')
        elif trad[1] == 'SC':
            values.append('Escamosas')
        elif trad[1] == 'FL':
            values.append('Enrojecidas')
        elif trad[1] == 'RP':
            values.append('Reproductores')
        elif trad[1] == 'RN':
            values.append('Ornamentales')
        elif trad[1] == 'ACM':
            values.append('Cemento')
        elif trad[1] == 'GM':
            values.append('Geomembrana')
        elif trad[1] == 'FC':
            values.append('Jaula flotante')
        elif trad[1] == 'ATR':
            values.append('Turbina')
        elif trad[1] == 'APR':
            values.append('Hélice')
        elif trad[1] == 'APL':
            values.append('Paleta')
        elif trad[1] == 'AVR':
            values.append('Flujo vertical')
        elif trad[1] == 'BT':
            values.append('Fondo')
        elif trad[1] == 'MD':
            values.append('Medio')
        elif trad[1] == 'SR':
            values.append('Superficie')
        elif trad[1] == 'NR':
            values.append('Normal')
        elif trad[1] == 'LT':
            values.append('Letárgico')
        elif trad[1] == 'RT':
            values.append('Errático')
        elif trad[1] == 'SP':
            values.append('En espiral')
        elif trad[1] == 'RB':
            values.append('Se frotan con la superficie')
        elif trad[1] == 'DR':
            values.append('Obscuro')
        elif trad[1] == 'APL':
            values.append('Pellet')
        elif trad[1] == 'AFL':
            values.append('Hojuela')
        elif trad[1] == 'ALV':
            values.append('Vivo')
        elif trad[1] == 'True':
            values.append('Si')
        elif trad[1] == 'False':
            values.append('No')
        elif trad[1] == '0.000':
            values.append('Sin datos')
        elif trad[1] == '0':
            values.append('Sin datos')
        else:
            values.append(trad[1])
    return values