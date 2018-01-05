from django.contrib import admin
from .models import *

class ImageQuestionInline(admin.TabularInline):
    model = ImageQuestion


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'description', 'date',)
    list_editable = ('description',)
    inlines = [
        ImageQuestionInline,
    ]

@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ('question', 'handle', 'message', 'timestamp',)    


@admin.register(Bovine)
class BovineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Porcine)
class PorcineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Horse)
class HorseAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Ovine)
class OvineAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Goat)
class GoatAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Rabbit)
class RabbitAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Bee)
class BeeAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Bird)
class BirdAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Dog)
class DogAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Cat)
class CatAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Wild)
class WildAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')


@admin.register(Aquatic)
class AquaticAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')

@admin.register(ImageQuestion)
class ImageAdmin(admin.ModelAdmin):
    list_display = ('id', 'question')

@admin.register(Document)
class DocumentAdmin(admin.ModelAdmin):
    list_display = ('id', 'question', 'document')