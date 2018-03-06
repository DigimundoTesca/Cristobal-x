# from background_task import background
from .models import Question, User
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import get_template
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib, time
from celery import shared_task


@shared_task
def time_on_emails(pk,user_speciality, html_content):    
    time.sleep(64800)
    pregunta = Question.objects.get(pk=pk)
    if pregunta.status == 'OP'and pregunta.pk==pk:        
        sendmailform(user_speciality, html_content)
        time_on_emails.delay(pk,user_speciality,html_content)

#@background(schedule=64800)
#def time_on_emails(pk,user_speciality, html_content):
#    pregunta = Question.objects.get(pk=pk)
#
#    if pregunta.status == 'OP'and pregunta.pk==pk:
#        time_on_emails(pk,user_speciality,html_content)
#        sendmailform(user_speciality, html_content)


def sendmailform(email_user, html_content):    
    if email_user:
        fromaddr = "albeitarfmvz@comunidad.unam.mx"
        toaddr = email_user
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "Una pregunta del grupo en el cual es usted especialista sigue sin ser contestada."

        body = html_content

        msg.attach(MIMEText(body, 'html'))

        # filename = "main.jpg"
        # attachment = open("C:/Users/Itzli/Documents/GitHub/Pet-Guru/pet_guru/static/images/", "rb")

        # part = MIMEBase('application', 'octet-stream')
        # part.set_payload((attachment).read())
        # encoders.encode_base64(part)
        # part.add_header('Content-Disposition', "attachment; filename= %s" % filename)

        # msg.attach(part)

        server = smtplib.SMTP('smtp-mail.outlook.com', 587)
        server.starttls()
        server.login(fromaddr, "Medicina_2018")
        text = msg.as_string()
        server.sendmail(fromaddr, toaddr, text)
        server.quit()
