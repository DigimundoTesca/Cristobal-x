
from django.conf.urls import url
from .views import ReporteUsuarios

app_name = 'analytics'

urlpatterns = [
    url(r'^reporte/$', ReporteUsuarios.as_view(), name='report'),
]
