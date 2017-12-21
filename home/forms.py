from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError


from .models import *
from users.models import User

class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ('message','document','image',)

class LogInForm(forms.Form):
    Usuario = forms.CharField(max_length=20)
    Contraseña = forms.CharField(max_length=20, widget=forms.PasswordInput())


class RegisterForm(UserCreationForm):
    class Meta:
        model = User
        fields = (
            'username',
            'email',
            'rol',
            'speciality',
            'date_end',
            'password1',
            'password2',
        )
        labels = {
            'username': 'Usuario',
            'email': 'Correo electronico',
            'rol': 'Tipo de usuario',
            'speciality': 'Especialidad',
            'date_end': 'Fecha de caducidad',
            'password1': 'Contraseña',
            'password2': 'Confirmar contraseña',
        }


class BaseForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(BaseForm, self).__init__(*args, **kwargs)
        self.fields['title'].widget.attrs.update({'class': 'form-control'})
        self.fields['description'].widget.attrs.update({'class': 'form-control'})
        self.fields['specie'].widget.attrs.update({'class': 'form-control', 'id': 'specieID'})
        self.fields['user_question'].widget.attrs.update({'class': 'hidden'})

    class Meta:
        model = Question
        fields = (
            'title',
            'description',
            'user_question',
            'specie',
        )
        labels = {
            'title': 'Título de la consulta: ',
            'description': 'Descripción de la consulta: ',
            'specie': 'Especie',
            'user_question': 'Usuario',
        }


class CowForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(CowForm, self).__init__(*args, **kwargs)
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'cowrace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'cowage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'cowgender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'cowweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'cowheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'cowresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'cowtemp'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'cowcapilar'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'cowmucosal'})
        self.fields['lymph_nodes'].widget.attrs.update({'class': 'form-control', 'id': 'cowlymph'})
        self.fields['ruminal'].widget.attrs.update({'class': 'form-control', 'id': 'cowruminal'})
        self.fields['body_condition'].widget.attrs.update({'class': 'form-control', 'id': 'cowcondition'})

    class Meta:
        model = Bovine
        fields = (
            'race',
            'age',
            'gender',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'capilar',
            'mucosal_color',
            'lymph_nodes',
            'ruminal',
            'body_condition',
        )
        labels = {
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'capilar': 'Llenado capilar (segundos): ',
            'mucosal_color': 'Color de mucosas: ',
            'lymph_nodes': 'Linfonodos: ',
            'ruminal': 'Movimientos ruminales: ',
            'body_condition': 'Condición corporal: ',
        }


class PorcineForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(PorcineForm, self).__init__(*args, **kwargs)
        self.fields['physiological_stage'].widget.attrs.update({'class': 'form-control', 'id': 'porphysio'})
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'porrace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'porage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'porgender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'porweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'porheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'porresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'portemp'})
        self.fields['production_system'].widget.attrs.update({'class': 'form-control', 'id': 'porprod'})
        self.fields['curse'].widget.attrs.update({'class': 'form-control', 'id': 'porcurse'})
        self.fields['attitude'].widget.attrs.update({'class': 'form-control', 'id': 'poratt'})
        self.fields['color'].widget.attrs.update({'class': 'form-control', 'id': 'porcolor'})
        self.fields['body_condition'].widget.attrs.update({'class': 'form-control', 'id': 'porcondition'})

    class Meta:
        model = Porcine
        fields = (
            'physiological_stage',
            'race',
            'age',
            'gender',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'production_system',
            'curse',
            'attitude',
            'color',
            'body_condition',
        )
        labels = {
            'physiological_stage': 'Etapa fisiológica: ',
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'production_system': 'Sistema de producción: ',
            'curse': 'Curso del padecimiento en días: ',
            'attitude': 'Actitud: ',
            'color': 'Coloración de la piel y/o mucosas: ',
            'body_condition': 'Condición corporal: ',
        }


class HorseForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(HorseForm, self).__init__(*args, **kwargs)
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'horrace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'horage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'horgender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'horweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'horheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'horresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'hortemp'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'horcapilar'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'hormucosal'})
        self.fields['lymph_nodes'].widget.attrs.update({'class': 'form-control', 'id': 'horlymph'})
        self.fields['body_condition'].widget.attrs.update({'class': 'form-control', 'id': 'horcondition'})

    class Meta:
        model = Horse
        fields = (
            'race',
            'age',
            'gender',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'capilar',
            'mucosal_color',
            'lymph_nodes',
            'body_condition',
        )
        labels = {
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'capilar': 'Llenado capilar (segundos): ',
            'mucosal_color': 'Color de mucosas: ',
            'lymph_nodes': 'Linfonodos: ',
            'body_condition': 'Condición corporal: ',
        }


class GoatForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(GoatForm, self).__init__(*args, **kwargs)
        self.fields['physiological_stage'].widget.attrs.update({'class': 'form-control', 'id': 'goatphysio'})
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'goatrace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'goatage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'goatgender'})
        self.fields['ruminal'].widget.attrs.update({'class': 'form-control', 'id': 'goatruminal'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'goatweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'goatheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'goatresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'goattemp'})
        self.fields['production_system'].widget.attrs.update({'class': 'form-control', 'id': 'goatprod'})
        self.fields['zootechnical'].widget.attrs.update({'class': 'form-control', 'id': 'goatzoo'})
        self.fields['lymph_nodes'].widget.attrs.update({'class': 'form-control', 'id': 'goatlymph'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'goatcapilar'})
        self.fields['cough'].widget.attrs.update({'class': 'form-control', 'id': 'goatcough'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'goatmucos'})
        self.fields['body_condition'].widget.attrs.update({'class': 'form-control', 'id': 'goatcondition'})

    class Meta:
        model = Goat
        fields = (
            'physiological_stage',
            'race',
            'age',
            'gender',
            'ruminal',
            'capilar',
            'cough',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'production_system',
            'zootechnical',
            'lymph_nodes',
            'mucosal_color',
            'body_condition',
        )
        labels = {
            'physiological_stage': 'Etapa fisiológica: ',
            'race': 'Raza: ',
            'age': 'Edad: ',
            'capilar': 'Tiempo de llenado capilar: ',
            'cough': 'Relfejo tusígeno: ',
            'gender': 'Sexo: ',
            'ruminal': 'Movimientos ruminales: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'production_system': 'Sistema de producción: ',
            'zootechnical': 'Fin zootécnico: ',
            'lymph_nodes': 'Linfonodos: ',
            'mucosal_color': 'Coloración de mucosas: ',
            'body_condition': 'Condición corporal: ',
        }


class OvineForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(OvineForm, self).__init__(*args, **kwargs)
        self.fields['physiological_stage'].widget.attrs.update({'class': 'form-control', 'id': 'oviphysio'})
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'ovirace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'oviage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'ovigender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'oviweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'oviheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'oviresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'ovitemp'})
        self.fields['production_system'].widget.attrs.update({'class': 'form-control', 'id': 'oviprod'})
        self.fields['zootechnical'].widget.attrs.update({'class': 'form-control', 'id': 'ovizoo'})
        self.fields['ruminal'].widget.attrs.update({'class': 'form-control', 'id': 'oviruminal'})
        self.fields['lymph_nodes'].widget.attrs.update({'class': 'form-control', 'id': 'ovilymph'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'ovimucos'})
        self.fields['body_condition'].widget.attrs.update({'class': 'form-control', 'id': 'ovicondition'})

    class Meta:
        model = Ovine
        fields = (
            'physiological_stage',
            'race',
            'age',
            'gender',
            'ruminal',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'production_system',
            'zootechnical',
            'lymph_nodes',
            'mucosal_color',
            'body_condition',
        )
        labels = {
            'physiological_stage': 'Etapa fisiológica: ',
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'ruminal': 'Movimientos ruminales: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'production_system': 'Sistema de producción: ',
            'zootechnical': 'Fin zootécnico: ',
            'lymph_nodes': 'Linfonodos: ',
            'mucosal_color': 'Coloración de mucosas: ',
            'body_condition': 'Condición corporal: ',
        }


class RabbitForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(RabbitForm, self).__init__(*args, **kwargs)
        self.fields['productive_stage'].widget.attrs.update({'class': 'form-control', 'id': 'rabprod'})
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'rabrace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'rabage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'rabgender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'rabweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'rabheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'rabresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'rabtemp'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'rabcapilar'})
        self.fields['dehydration'].widget.attrs.update({'class': 'form-control', 'id': 'rabdehy'})
        self.fields['lymph_nodes'].widget.attrs.update({'class': 'form-control', 'id': 'rablymph'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'rabmucos'})
        self.fields['body_condition'].widget.attrs.update({'class': 'form-control', 'id': 'rabcondition'})

    class Meta:
        model = Rabbit
        fields = (
            'productive_stage',
            'race',
            'age',
            'gender',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'capilar',
            'dehydration',
            'lymph_nodes',
            'mucosal_color',
            'body_condition',
        )
        labels = {
            'productive_stage': 'Etapa productiva: ',
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'capilar': 'Tiempo de llenado capilar: ',
            'dehydration': 'Deshidratación: ',
            'lymph_nodes': 'Ganglios linfáticos: ',
            'mucosal_color': 'Coloración de mucosas: ',
            'body_condition': 'Condición corporal: ',
        }


class BirdForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(BirdForm, self).__init__(*args, **kwargs)
        self.fields['type_animal'].widget.attrs.update({'class': 'form-control', 'id': 'birdtype'})
        self.fields['zootechnical_purpose'].widget.attrs.update({'class': 'form-control', 'id': 'birdzoo'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'birdage'})
        self.fields['age_week'].widget.attrs.update({'class': 'form-control', 'id': 'birdagew'})
        self.fields['age_month'].widget.attrs.update({'class': 'form-control', 'id': 'birdagem'})
        self.fields['place'].widget.attrs.update({'class': 'form-control', 'id': 'birdplace'})
        self.fields['quantity'].widget.attrs.update({'class': 'form-control', 'id': 'birdquant'})
        self.fields['coexistence'].widget.attrs.update({'class': 'form-control', 'id': 'birdexist'})
        self.fields['origin_water'].widget.attrs.update({'class': 'form-control', 'id': 'birdorigin'})
        self.fields['morbidity'].widget.attrs.update({'class': 'form-control', 'id': 'birdmorb'})
        self.fields['mortality'].widget.attrs.update({'class': 'form-control', 'id': 'birdmort'})
        self.fields['date_signs'].widget.attrs.update({'class': 'form-control', 'id': 'birddate'})
        self.fields['water'].widget.attrs.update({'class': 'form-control', 'id': 'birdwater'})
        self.fields['eat'].widget.attrs.update({'class': 'form-control', 'id': 'birdeat'})
        self.fields['vaccine'].widget.attrs.update({'class': 'form-control', 'id': 'birdvaccine'})
        self.fields['defecation'].widget.attrs.update({'class': 'form-control', 'id': 'birddefec'})
        self.fields['condition_corporal'].widget.attrs.update({'class': 'form-control', 'id': 'birdcondition'})
        self.fields['plumage'].widget.attrs.update({'class': 'form-control', 'id': 'birdplumage'})
        self.fields['condition_legs'].widget.attrs.update({'class': 'form-control', 'id': 'birdlegs'})
        self.fields['breathing_frequency'].widget.attrs.update({'class': 'form-control', 'id': 'birdbreath'})
        self.fields['dehydration'].widget.attrs.update({'class': 'form-control', 'id': 'birddehy'})
        self.fields['attitude'].widget.attrs.update({'class': 'form-control', 'id': 'birdatt'})

    class Meta:
        model = Bird
        fields = (
            'type_animal',
            'age',
            'age_week',
            'age_month',
            'place',
            'quantity',
            'coexistence',
            'origin_water',
            'zootechnical_purpose',
            'morbidity',
            'mortality',
            'date_signs',
            'water',
            'eat',
            'vaccine',
            'defecation',
            'condition_corporal',
            'plumage',
            'condition_legs',
            'breathing_frequency',
            'dehydration',
            'attitude',
        )
        labels = {
            'type_animal': 'Tipo de animal: ',
            'age': 'Edad: ',
            'age_week': 'Edad Semanas: ',
            'age_month': 'Edad Meses: ',
            'place': 'Lugar de encierro: ',
            'quantity': 'Cantidad de animales: ',
            'coexistence': 'Convivencia con otras aves: ',
            'origin_water': 'Origen del agua: ',
            'zootechnical_purpose': 'Fin zootécnico: ',
            'morbidity': 'Morbilidad: ',
            'mortality': 'Mortalidad: ',
            'date_signs': 'Fecha de inicio de los signos: ',
            'water': 'Consumo de agua: ',
            'eat': 'Consumo de alimento: ',
            'vaccine': 'Calendario de vacunaciones: ',
            'defecation': 'Defecación: ',
            'condition_corporal': 'Condición corporal: ',
            'plumage': 'Condición del plumaje: ',
            'condition_legs': 'Condición de las patas: ',
            'breathing_frequency': 'Frecuencia respiratoria: ',
            'dehydration': 'Deshidratación: ',
            'attitude': 'Actitud: ',
        }


class DogForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(DogForm, self).__init__(*args, **kwargs)
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'dograce'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'dogage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'doggender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'dogweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'dogheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'dogresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'dogtemp'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'dogcapilar'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'dogmucosal'})
        self.fields['cough'].widget.attrs.update({'class': 'form-control', 'id': 'dogcough'})
        self.fields['pulse'].widget.attrs.update({'class': 'form-control', 'id': 'dogpulse'})
        self.fields['skin'].widget.attrs.update({'class': 'form-control', 'id': 'dogskin'})

    class Meta:
        model = Dog
        fields = (
            'race',
            'age',
            'gender',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'capilar',
            'mucosal_color',
            'cough',
            'pulse',
            'skin',
        )
        labels = {
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'capilar': 'Llenado capilar (segundos): ',
            'mucosal_color': 'Color de mucosas: ',
            'cough': 'Relfejo tusígeno: ',
            'pulse': 'Pulso correspondiente: ',
            'skin': 'Lesiones en piel: ',
        }


class CatForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(CatForm, self).__init__(*args, **kwargs)
        self.fields['race'].widget.attrs.update({'class': 'form-control', 'id': 'catrace'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'catage'})
        self.fields['gender'].widget.attrs.update({'class': 'form-control', 'id': 'catgender'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'catweight'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'catheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'catresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'cattemp'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'catcapilar'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'catmucosal'})
        self.fields['cough'].widget.attrs.update({'class': 'form-control', 'id': 'catcough'})
        self.fields['pulse'].widget.attrs.update({'class': 'form-control', 'id': 'catpulse'})
        self.fields['skin'].widget.attrs.update({'class': 'form-control', 'id': 'catskin'})

    class Meta:
        model = Cat
        fields = (
            'race',
            'age',
            'gender',
            'weight',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'capilar',
            'mucosal_color',
            'cough',
            'pulse',
            'skin',
        )
        labels = {
            'race': 'Raza: ',
            'age': 'Edad: ',
            'gender': 'Sexo: ',
            'weight': 'Peso: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura (°C): ',
            'capilar': 'Llenado capilar (segundos): ',
            'mucosal_color': 'Color de mucosas: ',
            'cough': 'Relfejo tusígeno: ',
            'pulse': 'Pulso correspondiente: ',
            'skin': 'Lesiones en piel: ',
        }


class WildForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(WildForm, self).__init__(*args, **kwargs)
        self.fields['zootechnical'].widget.attrs.update({'class': 'form-control', 'id': 'wildzoo'})
        self.fields['ambiental_condition'].widget.attrs.update({'class': 'form-control', 'id': 'wildambiental'})
        self.fields['feeding'].widget.attrs.update({'class': 'form-control', 'id': 'wildfeed'})
        self.fields['background'].widget.attrs.update({'class': 'form-control', 'id': 'wildback'})
        self.fields['evolution_disease'].widget.attrs.update({'class': 'form-control', 'id': 'wildevol'})
        self.fields['heart_rate'].widget.attrs.update({'class': 'form-control', 'id': 'wildheart'})
        self.fields['respiratory_rate'].widget.attrs.update({'class': 'form-control', 'id': 'wildresp'})
        self.fields['temperature'].widget.attrs.update({'class': 'form-control', 'id': 'wildtemp'})
        self.fields['capilar'].widget.attrs.update({'class': 'form-control', 'id': 'wildcapilar'})
        self.fields['mucosal_color'].widget.attrs.update({'class': 'form-control', 'id': 'wildmucos'})
        self.fields['lymph_nodes'].widget.attrs.update({'class': 'form-control', 'id': 'wildlymph'})
        self.fields['ruminal'].widget.attrs.update({'class': 'form-control', 'id': 'wildruminal'})

    class Meta:
        model = Wild
        fields = (
            'zootechnical',
            'ambiental_condition',
            'feeding',
            'background',
            'evolution_disease',
            'heart_rate',
            'respiratory_rate',
            'temperature',
            'capilar',
            'mucosal_color',
            'lymph_nodes',
            'ruminal',
        )
        labels = {
            'zootechnical': 'Fin zootécnico: ',
            'ambiental_condition': 'Condiciones Medio-Ambientales: ',
            'feeding': 'Alimentación: ',
            'background': 'Antecedentes patológicos/hereditarios: ',
            'evolution_disease': 'Evolución de la enfermedad actual: ',
            'heart_rate': 'Frecuencia cardiaca (lpm): ',
            'respiratory_rate': 'Frecuencia respiratoria (rpm): ',
            'temperature': 'Temperatura: ',
            'capilar': 'Tiempo de llenado capilar: ',
            'mucosal_color': 'Coloracion de mucosas: ',
            'lymph_nodes': 'Linfonodos: ',
            'ruminal': 'Movimientos ruminales: ',
        }


class AquaticForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AquaticForm, self).__init__(*args, **kwargs)
        self.fields['genetic'].widget.attrs.update({'class': 'form-control', 'id': 'aqgenetic'})
        self.fields['zootechnical'].widget.attrs.update({'class': 'form-control', 'id': 'aqzoo'})
        self.fields['age'].widget.attrs.update({'class': 'form-control', 'id': 'aqage'})
        self.fields['weight'].widget.attrs.update({'class': 'form-control', 'id': 'aqweight'})
        self.fields['pond'].widget.attrs.update({'class': 'form-control', 'id': 'aqpond'})
        self.fields['density'].widget.attrs.update({'class': 'form-control', 'id': 'aqdensity'})
        self.fields['biomass'].widget.attrs.update({'class': 'form-control', 'id': 'aqbiomass'})
        self.fields['aeration'].widget.attrs.update({'class': 'form-control', 'id': 'aqaeration'})
        self.fields['aeration_type'].widget.attrs.update({'class': 'form-control', 'id': 'aqaeratp'})
        self.fields['recirculation_water'].widget.attrs.update({'class': 'form-control', 'id': 'aqrecir'})
        self.fields['change_water'].widget.attrs.update({'class': 'form-control', 'id': 'aqchange'})
        self.fields['date_sowing'].widget.attrs.update({'class': 'form-control', 'id': 'aqsowing'})
        self.fields['temperature_6am'].widget.attrs.update({'class': 'form-control', 'id': 'aq6am'})
        self.fields['temperature_3pm'].widget.attrs.update({'class': 'form-control', 'id': 'aq3pm'})
        self.fields['oxygen_6am'].widget.attrs.update({'class': 'form-control', 'id': 'aqox6'})
        self.fields['oxygen_3pm'].widget.attrs.update({'class': 'form-control', 'id': 'aqox3'})
        self.fields['ph_6am'].widget.attrs.update({'class': 'form-control', 'id': 'aqph6'})
        self.fields['ph_3pm'].widget.attrs.update({'class': 'form-control', 'id': 'aqph3'})
        self.fields['no2'].widget.attrs.update({'class': 'form-control', 'id': 'aqno2'})
        self.fields['nh4'].widget.attrs.update({'class': 'form-control', 'id': 'aqnh4'})
        self.fields['nh3'].widget.attrs.update({'class': 'form-control', 'id': 'aqnh3'})
        self.fields['transparency'].widget.attrs.update({'class': 'form-control', 'id': 'aqtransp'})
        self.fields['mortality'].widget.attrs.update({'class': 'form-control', 'id': 'aqmort'})
        self.fields['start_mortality'].widget.attrs.update({'class': 'form-control', 'id': 'aqstr'})
        self.fields['position'].widget.attrs.update({'class': 'form-control', 'id': 'aqpos'})
        self.fields['body_color'].widget.attrs.update({'class': 'form-control', 'id': 'aqbdcl'})
        self.fields['moves'].widget.attrs.update({'class': 'form-control', 'id': 'aqmove'})
        self.fields['lack_of_appetite'].widget.attrs.update({'class': 'form-control', 'id': 'aqlck'})
        self.fields['type_eat'].widget.attrs.update({'class': 'form-control', 'id': 'aqtpeat'})
        self.fields['eat_for_day'].widget.attrs.update({'class': 'form-control', 'id': 'aqeatday'})
        self.fields['coloration'].widget.attrs.update({'class': 'form-control', 'id': 'aqcol'})
        self.fields['bulging_belly'].widget.attrs.update({'class': 'form-control', 'id': 'aqbulging'})
        self.fields['exophthalmia'].widget.attrs.update({'class': 'form-control', 'id': 'aqexoph'})
        self.fields['petechia'].widget.attrs.update({'class': 'form-control', 'id': 'aqpetech'})
        self.fields['dilated'].widget.attrs.update({'class': 'form-control', 'id': 'aqdilated'})
        self.fields['ulcers'].widget.attrs.update({'class': 'form-control', 'id': 'aqulcer'})
        self.fields['skin_sores'].widget.attrs.update({'class': 'form-control', 'id': 'aqsore'})
        self.fields['cotton_structures'].widget.attrs.update({'class': 'form-control', 'id': 'aqcott'})
        self.fields['necrosis_epidermal_layer'].widget.attrs.update({'class': 'form-control', 'id': 'aqnecr'})
        self.fields['ocular_opacity'].widget.attrs.update({'class': 'form-control', 'id': 'aqopac'})

    class Meta:
        model = Aquatic
        fields = (
            'genetic',
            'zootechnical',
            'age',
            'weight',
            'pond',
            'density',
            'biomass',
            'aeration',
            'aeration_type',
            'recirculation_water',
            'change_water',
            'date_sowing',
            'temperature_6am',
            'temperature_3pm',
            'oxygen_6am',
            'oxygen_3pm',
            'ph_6am',
            'ph_3pm',
            'no2',
            'nh4',
            'nh3',
            'transparency',
            'mortality',
            'start_mortality',
            'position',
            'body_color',
            'moves',
            'lack_of_appetite',
            'type_eat',
            'eat_for_day',
            'coloration',
            'bulging_belly',
            'exophthalmia',
            'petechia',
            'dilated',
            'ulcers',
            'skin_sores',
            'cotton_structures',
            'necrosis_epidermal_layer',
            'ocular_opacity',
        )
        labels = {
            'genetic': 'Grupo genético: ',
            'zootechnical': 'Fin zootécnico: ',
            'age': 'Edad: ',
            'weight': 'Peso promedio de la población: ',
            'pond': 'Tipo de estanque: ',
            'density': 'densidad: ',
            'biomass': 'Biomasa: ',
            'aeration': 'Presencia de sistema de aireación: ',
            'aeration_type': 'Tipo de aireador: ',
            'recirculation_water': 'Presencia de sistema de recirculación de agua: ',
            'change_water': 'Recambio diario de agua: ',
            'date_sowing': 'Fecha de siembra: ',
            'temperature_6am': 'Temperatura (6 am): ',
            'temperature_3pm': 'Temperatura (3 pm): ',
            'oxygen_6am': 'Oxígeno disuelto en agua (6 am): ',
            'oxygen_3pm': 'Oxígeno disuelto en agua (3 pm): ',
            'ph_6am': 'pH (6 am): ',
            'ph_3pm': 'pH (3 pm): ',
            'no2': 'Nitritos (NO2): ',
            'nh4': 'Amonio (NH4: ',
            'nh3': 'Amoniaco (NH3): ',
            'transparency': 'Transparencia: ',
            'mortality': 'Mortalidad acumulada: ',
            'start_mortality': 'Inicio de la mortandad: ',
            'position': 'Posición de los peces en la columna de agua: ',
            'body_color': 'Coloración del cuerpo de los peces: ',
            'moves': 'Tipo de movimiento de los peces en el agua: ',
            'lack_of_appetite': 'Inapetencia: ',
            'type_eat': 'Tipo de alimentación: ',
            'eat_for_day': 'Cantidad de alimento administrado por día: ',
            'coloration': 'Coloración: ',
            'bulging_belly': 'Vientre abultado: ',
            'exophthalmia': 'Exoftalmia: ',
            'petechia': 'Petequias en base de aletas: ',
            'dilated': 'Aletas desilachadas: ',
            'ulcers': 'Úlceras: ',
            'skin_sores': 'Llagas en piel: ',
            'cotton_structures': 'Estructuras algodonosas: ',
            'necrosis_epidermal_layer': 'Necrosis en capa epidérmica: ',
            'ocular_opacity': 'Opacidad ocular: ',
        }


class BeeForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(BeeForm, self).__init__(*args, **kwargs)
        self.fields['colony_type'].widget.attrs.update({'class': 'form-control', 'id': 'beecolony'})
        self.fields['hive_review'].widget.attrs.update({'class': 'form-control', 'id': 'beehive'})
        self.fields['queen_presence'].widget.attrs.update({'class': 'form-control', 'id': 'beequeen'})
        self.fields['disease_signs'].widget.attrs.update({'class': 'form-control', 'id': 'beesigns'})
        self.fields['breeding'].widget.attrs.update({'class': 'form-control', 'id': 'beebreed'})
        self.fields['adult_bee'].widget.attrs.update({'class': 'form-control', 'id': 'beeadult'})
        self.fields['backstage_bee'].widget.attrs.update({'class': 'form-control', 'id': 'beeback'})
        self.fields['real_cell'].widget.attrs.update({'class': 'form-control', 'id': 'beecell'})
        self.fields['backstage_breeding'].widget.attrs.update({'class': 'form-control', 'id': 'beebckbreed'})
        self.fields['eggs'].widget.attrs.update({'class': 'form-control', 'id': 'beeegg'})
        self.fields['quantity_eggs'].widget.attrs.update({'class': 'form-control', 'id': 'beequant'})
        self.fields['observations'].widget.attrs.update({'class': 'form-control', 'id': 'beeobs'})
        self.fields['stool_spots'].widget.attrs.update({'class': 'form-control', 'id': 'beestool'})
        self.fields['piece_larvae'].widget.attrs.update({'class': 'form-control', 'id': 'beepiece'})
        self.fields['dead_bees'].widget.attrs.update({'class': 'form-control', 'id': 'beedead'})
        self.fields['food_racks'].widget.attrs.update({'class': 'form-control', 'id': 'beefood'})
        self.fields['number_racks'].widget.attrs.update({'class': 'form-control', 'id': 'beerack'})

    class Meta:
        model = Bee
        fields = (
            'colony_type',
            'hive_review',
            'queen_presence',
            'disease_signs',
            'breeding',
            'adult_bee',
            'backstage_bee',
            'real_cell',
            'backstage_breeding',
            'eggs',
            'quantity_eggs',
            'observations',
            'stool_spots',
            'piece_larvae',
            'dead_bees',
            'food_racks',
            'number_racks',
        )
        labels = {
            'colony_type': 'Tipo de colonia: ',
            'hive_review': 'Revisión de colmena: ',
            'queen_presence': 'Presencia de la reina: ',
            'disease_signs': 'Signos de enfermedad: ',
            'breeding': 'Cría: ',
            'adult_bee': 'Abeja adulta: ',
            'backstage_bee': 'Número de bastidores cubiertos por abejas en la cámara de cría y en las alzas: ',
            'real_cell': 'Presencia de celdas reales: ',
            'backstage_breeding': 'Número de bastidores cubiertos por cría: ',
            'eggs': 'Presencia de huevos: ',
            'quantity_eggs': 'Cantidad de huevos por celda: ',
            'observations': 'Observación de características anormales en la entrada de la colmena: ',
            'stool_spots': 'Manchas de heces: ',
            'piece_larvae': 'Pedazos de larvas o larvas completas: ',
            'dead_bees': 'sencia de abejas muertas al frente de la piquera: ',
            'food_racks': 'Presencia de alimento en bastidores: ',
            'number_racks': 'Número de bastidores con miel, polen o néctar: ',
        }


class ImageQuestionForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ImageQuestionForm, self).__init__(*args, **kwargs)
        self.fields['image'].widget.attrs.update({'class': 'btn btn-info', })

    image = forms.ImageField(label='')

    class Meta:
        model = ImageQuestion
        fields = ('image', )


class DocumentForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(DocumentForm, self).__init__(*args, **kwargs)
        self.fields['document'].widget.attrs.update({'class': 'btn btn-info', })

    class Meta:
        model = Document
        fields = ('document',)
        labels = { 'document': '',}