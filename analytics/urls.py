
from django.conf.urls import url
from .views import ReporteUsuarios

app_name = 'analytics'

urlpatterns = [
    url(r'^analytics/test/reportes/$', ReporteUsuarios.as_view(), name='reporte_usuarios'),
]
