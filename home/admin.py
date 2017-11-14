from django.contrib import admin

from .models import Question
from .models import Bovine
from .models import Porcine
from .models import Horse
from .models import Ovine
from .models import Goat
from .models import Rabbit
from .models import Bee
from .models import Bird


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'description', 'date',)
    list_editable = ('description',)


@admin.register(Bovine)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Porcine)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Horse)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Ovine)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Goat)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Rabbit)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Bee)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Bird)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')
