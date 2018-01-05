from pet_guru.settings.devp import *

# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.getenv('PET_GURU_DB_NAME'),
        'USER': os.getenv('PET_GURU_DB_USER'),
        'PASSWORD': os.getenv('PET_GURU_DB_PASSWORD'),
        'HOST': os.getenv('PET_GURU_DB_HOST'),
        'PORT': os.getenv('PET_GURU_DB_PORT'),
    }
}