from django.contrib import admin

from .models import Question, ImageQuestion, Message, Bovine, Porcine, Horse, Ovine, Goat, Rabbit, Bee, Bird

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
