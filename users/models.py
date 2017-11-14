from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    DEFAULT_USER = 1

    TEACHER = 'TC'
    STUDENT = 'ST'
    ADMINISTRATOR = 'AD'

    ROL = (
        (TEACHER, 'Profesor'),
        (STUDENT, 'Alumno'),
        (ADMINISTRATOR, 'Administrador'),
    )

    BOVINO = 'BV'
    PORCINO  = 'PR'
    EQUINO  = 'EQ'
    OVINO = 'OV'
    CAPRINO = 'CP'
    LEPORIDO = 'LP'
    AVE = 'AV'
    CANINO = 'CN'
    FELINO = 'FL'
    SILVESTRE = 'SL'
    ABEJA = 'BJ'


    SPECIES = (
        (BOVINO, 'Bovino'),
        (PORCINO, 'Porcino'),
        (EQUINO, 'Equino'),
        (OVINO, 'Ovino'),
        (CAPRINO, 'Caprino'),
        (LEPORIDO, 'Lepórido'),
        (AVE, 'Ave'),
        (CANINO, 'Canino'),
        (FELINO, 'Felino'),
        (SILVESTRE, 'Silvestre'),
        (ABEJA, 'Abeja'),
    )

    rol = models.CharField(max_length=3, choices=ROL, default='ST')
    speciality = models.CharField(max_length=15, choices=SPECIES)

    class Meta(AbstractUser.Meta):
        swappable = 'AUTH_USER_MODEL'
