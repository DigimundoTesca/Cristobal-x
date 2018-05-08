from django.conf.urls import url
from . import views

app_name = 'home'

urlpatterns = [
    url(r'^$', views.index, name='inicio'),
    url(r'^user/$', views.user, name='usuario'),
    url(r'^cards/$', views.cards, name='articulos'),
    url(r'^nosotros/$', views.us, name='nosotros'),
    url(r'^reglamento/$', views.rules, name='reglamento'),
    url(r'^revision/$', views.check, name='revision'),
    url(r'^pregunta/(?P<id>\d+)/$', views.question, name='pregunta'),
    url(r'^registro/$', views.register, name='register'),
    url(r'^listado/$', views.userlist, name='userlist'),
    url(r'^tutorial/$', views.tuto, name='tutorial'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^search/$', views.search, name='search'),
    # Just for develop; delete on production
    # url(r'^buscar/(?P<label>\w+)/$', views.search, name='search'),
    url(r'^mail/$', views.mail, name='mail'),
]
