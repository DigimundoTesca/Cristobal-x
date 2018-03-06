import os
from celery import Celery

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pet_guru.settings')

app = Celery('pet_guru')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()