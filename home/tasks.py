from background_task import background
from .models import Question, User
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import get_template
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib


@background(schedule=5)
def time_on_emails(pk,user_speciality, html_content):
    pregunta = Question.objects.get(pk=pk)    

    if pregunta.status == 'OP'and pregunta.pk==pk:
        sendmailform(user_speciality, html_content)


def sendmailform(email_user, html_content):    
    if email_user:
        fromaddr = "albeitarfmvz@comunidad.unam.mx"
        toaddr = email_user
        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "Aun no se ah respondido la pregunta en el grupo del cual usted es especialista."

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