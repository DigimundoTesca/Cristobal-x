from django.conf.urls import include, url
from . import views

app_name='chat'

urlpatterns = (
    url(r'^chat/(?P<id>[0-9]+)/$', views.chat_room, name='chat_room'),
)