from decimal import Decimal

from django.db import models
from django.core.validators import MinValueValidator
from django.core.urlresolvers import reverse
from django.shortcuts import get_object_or_404
from django.utils.text import slugify
from django.utils import timezone
from django.shortcuts import get_object_or_404

from users.models import User


class Question(models.Model):

    DEFAULT_QUESTION = 1

    OPEN = 'OP'
    CLOSE = 'CL'
    RESPONDING = 'RP'

    STATUS = (
        (OPEN, 'Abierta'),
        (CLOSE, 'Cerrada'),
        (RESPONDING, 'Respondiendo'),
    )

    BOVINO = 'BV'
    PORCINO = 'PR'
    EQUINO = 'EQ'
    OVINO = 'OV'
    CAPRINO = 'CP'
    LEPORIDO = 'LP'
    AVE = 'AV'
    CANINO = 'CN'
    FELINO = 'FL'
    SILVESTRE = 'SL'
    ABEJA = 'BJ'
    AQUATICO = 'AQ'

    SPECIES = (
        (BOVINO, 'Vaca'),
        (PORCINO, 'Cerdo'),
        (EQUINO, 'Caballo'),
        (OVINO, 'Oveja'),
        (CAPRINO, 'Cabra'),
        (LEPORIDO, 'Conejo'),
        (AVE, 'Ave'),
        (CANINO, 'Perro'),
        (FELINO, 'Gato'),
        (SILVESTRE, 'Fauna silvestre'),
        (ABEJA, 'Abeja'),
        (AQUATICO, 'Organismos acuáticos'),
    )

    title = models.CharField(max_length=100, null=True)
    description = models.TextField(null=True)
    status = models.CharField(max_length=2, null=True, choices=STATUS, default='OP')
    user_question = models.ForeignKey(User, related_name='student_question', default=User.DEFAULT_USER, )
    user_response = models.ForeignKey(User, related_name='teacher_question', default=User.DEFAULT_USER)
    calification = models.PositiveSmallIntegerField(default=0)
    date = models.DateTimeField(editable=False, auto_now=True, null=True)
    specie = models.CharField(max_length=10, choices=SPECIES)

    def __str__(self):
        return '%s' % self.title

    def get_absolute_url(self):
        return reverse("home:pregunta", kwargs={'id': self.id})

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Question._meta.fields]

    def get_obj_specie(self):
        if self.specie == 'BV':
            objspecie = get_object_or_404(Bovine, question=self.id)
        elif self.specie == 'PR':
            objspecie = get_object_or_404(Porcine, question=self.id)
        elif self.specie == 'EQ':
            objspecie = get_object_or_404(Horse, question=self.id)
        elif self.specie == 'OV':
            objspecie = get_object_or_404(Ovine, question=self.id)
        elif self.specie == 'CP':
            objspecie = get_object_or_404(Goat, question=self.id)
        elif self.specie == 'LP':
            objspecie = get_object_or_404(Rabbit, question=self.id)
        elif self.specie == 'AV':
            objspecie = get_object_or_404(Bird, question=self.id)
        elif self.specie == 'CN':
            objspecie = get_object_or_404(Dog, question=self.id)
        elif self.specie == 'FL':
            objspecie = get_object_or_404(Cat, question=self.id)
        elif self.specie == 'SL':
            objspecie = get_object_or_404(Wild, question=self.id)
        elif self.specie == 'BJ':
            objspecie = get_object_or_404(Bee, question=self.id)
        elif self.specie == 'AQ':
            objspecie = get_object_or_404(Aquatic, question=self.id)
        return objspecie

    def get_first_image(self):
        images = ImageQuestion.objects.filter(question=self.pk)
        if images:
            image = images[0]
            return image.image.url
        else:
            return self.get_obj_specie().DEFAULT_IMAGE

    def get_document(self):
        document = Document.objects.get(question=self.pk)
        if document:
            document = document[0]
            return document.document.url

def get_image_filename(instance, filename):
    title = instance.question.title
    slug = slugify(title)

    return "question_images/%s-%s" % (slug, filename)


class ImageQuestion(models.Model):
    question = models.ForeignKey(Question, default=None)
    image = models.ImageField(upload_to=get_image_filename, verbose_name='images')

    def __str__(self):
        return '%s' % self.id

class Message(models.Model):    
    question = models.ForeignKey(Question, default=None,related_name='messages')
    handle = models.TextField()
    timestamp = models.DateTimeField(default=timezone.now, db_index=True)
    message = models.TextField(max_length=200)
    image = models.ImageField(upload_to='image_messages/', blank=True, default=None)
    document = models.FileField(upload_to='documents/', blank=True, default=None)

    def __unicode__(self):
        return '[{timestamp}] {handle}: {message}'.format(**self.as_dict())

    @property
    def formatted_timestamp(self):
        return self.timestamp.strftime("%m-%d-%Y %H:%I%p")


class Specie(models.Model):

    MALE = 'ML'
    FEMALE = 'FM'

    SEX = (
        (MALE, 'Macho'),
        (FEMALE, 'Hembra'),
    )
    FIELDS_S = ('id', 'Pregunta', 'Raza', 'Edad', 'Sexo', 'Peso','numero de especie')
    question = models.OneToOneField(Question, default='', related_name='specie_question')
    race = models.CharField(max_length=20, null=False)
    age = models.IntegerField(validators=[MinValueValidator(Decimal('0'))])
    gender = models.CharField(max_length=3, choices=SEX, default=MALE)
    weight = models.DecimalField(max_digits=5, decimal_places=3)

    def __str__(self):
        return '%s' % self.SPECIES_NUM[self.specie]

    def get_specie_fields(self):
        return [(field.value_to_string(self)) for field in Specie._meta.fields]


class Bovine(Specie):
    DEFAULT_IMAGE = 'http://cdn5.dibujos.net/dibujos/pintados/201139/c6c2a31a420635956585ca265baa0118.png'
    FIELDS = Specie.FIELDS_S + ('Frecuencia cardiaca', 'Frecuencia respiratoria', 'Temperatura(C°)', 'Llenado capilar',
                                'Color de mucosa', 'Linfonodos', 'Movimientos Ruminales', 'Condicion corporal')
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    capilar = models.IntegerField()
    mucosal_color = models.CharField(max_length=30, null=True)
    lymph_nodes = models.CharField(max_length=50, null=True)
    ruminal = models.CharField(max_length=80, null=True)
    body_condition = models.TextField(null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Bovine._meta.fields]


class Goat(Specie):
    DEFAULT_IMAGE = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hausziege_04.jpg/250px-Hausziege_04.jpg'
    FIELDS = Specie.FIELDS_S + ('Etapa fisiológica', 'Fin zootécnico', 'Sistema de produccion', 'Frecuencia cardiaca', 'frecuencia respiratoria', 'Temperatura(C°)', 'Llenado capilar',
                                'Color de mucosa', 'Linfonodos', 'Movimientos Ruminales', 'Condicion corporal', 'Reflejo tusígeno')
    physiological_stage = models.CharField(max_length=30, null=True)
    zootechnical = models.CharField(max_length=50, null=True)
    production_system = models.CharField(max_length=30, null=True)
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    capilar = models.IntegerField()
    mucosal_color = models.CharField(max_length=30, null=True)
    lymph_nodes = models.CharField(max_length=50, null=True)
    ruminal = models.CharField(max_length=80, null=True)
    body_condition = models.TextField(null=True)
    cough = models.CharField(max_length=80, null=True)
    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Goat._meta.fields]


class Rabbit(Specie):
    LACTATING = 'LC'
    PREGNANT = 'PG'
    INCREASE = 'IC'
    FATTEN = 'FT'

    PRODUCTIVE = (
        (LACTATING, 'Lactante'),
        (PREGNANT, 'Gestante'),
        (INCREASE, 'Crecimiento'),
        (FATTEN, 'Engorda'),
    )
    FIELDS = Specie.FIELDS_S + ('Etapa productiva', 'Frecuencia cardiaca', 'Frecuencia respiratoria', 'Temperatura(C°)',
                                'Llenado capilar', 'Color de mucosa', 'Linfonodos', 'Condicion corporal', 'Deshidratación')
    DEFAULT_IMAGE = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Oryctolagus_cuniculus_Tasmania_2.jpg/1200px-Oryctolagus_cuniculus_Tasmania_2.jpg'
    productive_stage = models.CharField(max_length=10, choices=PRODUCTIVE, default=LACTATING)
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    capilar = models.IntegerField()
    mucosal_color = models.CharField(max_length=30, null=True)
    lymph_nodes = models.CharField(max_length=50, null=True)
    body_condition = models.TextField(null=True)
    dehydration = models.CharField(max_length=50, null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Rabbit._meta.fields]


class Ovine(Specie):
    DEFAULT_IMAGE = 'http://www.infoanimales.com/wp-content/uploads/2016/06/Informaci%C3%B3n-sobre-la-oveja-1.jpg'
    FIELDS = Specie.FIELDS_S + ('Etapa fisiológica', 'Fin zootécnico', 'Sistema de produccion', 'Frecuencia cardiaca',
                                'frecuencia respiratoria', 'Temperatura(C°)', 'Color de mucosa', 'Linfonodos',
                                'Movimientos Ruminales', 'Condicion corporal')
    physiological_stage = models.CharField(max_length=30, null=True)
    zootechnical = models.CharField(max_length=50, null=True)
    production_system = models.CharField(max_length=30, null=True)
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    mucosal_color = models.CharField(max_length=30, null=True)
    lymph_nodes = models.CharField(max_length=50, null=True)
    ruminal = models.CharField(max_length=80, null=True)
    body_condition = models.TextField(null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Ovine._meta.fields]


class Dog(Specie):
    DEFAULT_IMAGE = 'https://www.anipedia.net/imagenes/que-comen-los-perros.jpg'
    FIELDS = Specie.FIELDS_S + ('Frecuencia cardiaca', 'frecuencia respiratoria', 'Temperatura(C°)', 'Color de mucosa',
                                'Llenado capilar', 'Reflejo tusígeno', 'Pulso', 'Lesiones en piel')
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    mucosal_color = models.CharField(max_length=30, null=True)
    capilar = models.IntegerField()
    cough = models.CharField(max_length=80, null=True)
    pulse = models.CharField(max_length=80, null=True)
    skin = models.CharField(max_length=80, null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Dog._meta.fields]


class Cat(Specie):
    DEFAULT_IMAGE = 'http://www.petmd.com/sites/default/files/scared-kitten-shutterstock_191443322.jpg'
    FIELDS = Specie.FIELDS_S + ('Frecuencia cardiaca', 'frecuencia respiratoria', 'Temperatura(C°)', 'Color de mucosa',
                                'Llenado capilar', 'Reflejo tusígeno', 'pulso', 'Lesiones en piel')
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    mucosal_color = models.CharField(max_length=30, null=True)
    capilar = models.IntegerField()
    cough = models.CharField(max_length=80, null=True)
    pulse = models.CharField(max_length=80, null=True)
    skin = models.CharField(max_length=80, null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Dog._meta.fields]


class Porcine(Specie):
    DEFAULT_IMAGE = 'https://www.elisagenie.com/wp-content/uploads/2017/03/Porcine-Pig-ELISA-Assay-1.jpg'
    FIELDS = Specie.FIELDS_S + ('Etapa fisiológica', 'Sistema de produccion', 'Curso de padecimiento en dias',
                                'Frecuencia cardiaca', 'frecuencia respiratoria', 'Temperatura(C°)', 'Condicion corporal'
                                , 'Actitude', 'color')
    physiological_stage = models.CharField(max_length=30, null=True)
    production_system = models.CharField(max_length=30, null=True)
    curse = models.CharField(max_length=60, null=True)
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    body_condition = models.TextField(null=True)
    attitude = models.TextField(null=True)
    color = models.CharField(max_length=30, null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Porcine._meta.fields]


class Bee(models.Model):
    RUSTIC = 'RS'
    WILD = 'WL'
    TECHNIFIED = 'TC'
    JUMBO = 'JM'

    COLONY = (
        (RUSTIC, 'Rústica'),
        (WILD, 'Silvestre'),
        (TECHNIFIED, 'Tecnificada Lamgstroth'),
        (JUMBO, 'Tecnificada jumbo'),
    )

    LARVACOLOR = 'BC'
    PERFORATED = 'PR'
    FATTY = 'FT'
    APRICOTS = 'APR'
    NOT_VERIFIED = 'NV'

    LARVA = (
        (LARVACOLOR, 'Larvas de color anormal'),
        (PERFORATED, 'Perforadas'),
        (FATTY, 'Aspecto grasoso'),
        (APRICOTS, 'Opérculos raídos'),
        (NOT_VERIFIED, 'No Verificado'),
    )

    STOMACH = 'ST'
    SLOW = 'SL'
    CHOP = 'CH'
    ALOPECIA = 'LP'
    SHINY = 'SH'
    NOT_VERIFIED = 'NV'

    ADULTBEES = (
        (STOMACH, 'Abdomen distendido'),
        (SLOW, 'Lentas'),
        (CHOP, 'Pérdida del instinto de picar'),
        (ALOPECIA, 'Alopécicas'),
        (SHINY, 'Brillosas'),
        (NOT_VERIFIED, 'No Verificado'),
    )

    PRESENT = 'PS'
    NOTPRESENT = 'NT'
    NOT_VERIFIED = 'NV'

    PRESENT_T = (
        (PRESENT, 'Presente'),
        (NOTPRESENT, 'No Presente'),
        (NOT_VERIFIED, 'NO Verificado'),
    )

    DEFAULT_IMAGE = 'https://media.mnn.com/assets/images/2017/07/HoneyBeeSittingOnAFlower.jpg.838x0_q80.jpg'
    FIELDS = ('id','Pregunta', 'Especie', 'Tipo de colonia', 'Revision de colmena', 'Presencia de reina',
              'Signos de enfermedad', 'Cría', 'Abeja adulta', 'Número de bastidores cubiertos por abejas en la cámara de cría y en las alzas',
              'Presencia de huevos', 'Cantidad de huevos', 'Observacion', 'Manchas de heces', 'Pedazos de larvas',
              'Presencia de abejas muertas', 'Presencia de comida en bastidores', 'Numero de bastidores')
    question = models.OneToOneField(Question, default='')
    specie = models.CharField(max_length=30)
    colony_type = models.CharField(max_length=3, choices=COLONY)
    hive_review = models.CharField(max_length=80)
    queen_presence = models.CharField(max_length=3, choices=PRESENT_T)
    disease_signs = models.CharField(max_length=80)
    breeding = models.CharField(max_length=3,choices=LARVA)
    adult_bee = models.CharField(max_length=3, choices=ADULTBEES)
    backstage_bee = models.IntegerField()
    real_cell = models.CharField(max_length=50)
    backstage_breeding = models.IntegerField()
    eggs = models.NullBooleanField(null=True)
    quantity_eggs = models.IntegerField()
    observations = models.TextField()
    stool_spots = models.CharField(max_length=3, choices=PRESENT_T)
    piece_larvae = models.CharField(max_length=3, choices=PRESENT_T)
    dead_bees = models.CharField(max_length=3, choices=PRESENT_T)
    food_racks = models.CharField(max_length=3, choices=PRESENT_T)
    number_racks = models.IntegerField()

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Bee._meta.fields]


class Bird(models.Model):
    YOUNG = 'YN'
    ADULT = 'DL'
    AGE = (
        (YOUNG, 'Joven'),
        (ADULT, 'Adulto'),
    )

    CAGE = 'CG'
    FREE = 'FR'
    HENHOUSE = 'HH'

    CONFINEMENT = (
        (CAGE, 'Jaula'),
        (HENHOUSE, 'Gallinero'),
        (FREE, 'Libre'),
    )

    YES = 'YS'
    NO = 'NO'

    DRINK = (
        (YES, 'Si'),
        (NO, 'No'),
    )

    FOOD = (
        (YES, 'Si'),
        (NO, 'No'),
    )

    LIQUID = 'LQ'
    WHITE = 'WH'
    GREEN = 'GR'
    OTHER = 'TH'
    COMPACT = 'CM'

    DEFECATION = (
        (COMPACT, 'Compactas'),
        (LIQUID, 'Líquidas'),
        (WHITE, 'Blancas'),
        (GREEN, 'Verdes'),
        (OTHER, 'Otros'),
    )

    SCALY = 'SC'
    FLUSHED = 'FL'

    LEGS = (
        (SCALY, 'Escamosas'),
        (FLUSHED, 'Enrojecidas'),
    )

    AQFATTEN = 'FT'
    AQREPRODUCTIVE = 'RP'
    ORNAMENTAL = 'RN'

    AQZOOTECHNICAL = (
        (AQFATTEN, 'Engorda'),
        (AQREPRODUCTIVE, 'Reproductores'),
        (ORNAMENTAL, 'Ornamentales'),
    )

    DEFAULT_IMAGE = 'https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg'
    FIELDS = ('id', 'Pregunta', 'Tipo de animal', 'fin zootécnico', 'Edad', 'Edad semanas', 'Edad meses',
              'Lugar de encierro', 'Cantidad de animales', 'Convivencia con otras aves', 'Origen del agua', 'Morbilidad'
              , 'Mortalidad', 'Fecha de inicio de los signos', 'Consumo de agua', 'Consumo de alimentos',
              'Calendario de vacunación', 'Defecacion', 'condicion corporal', 'Condicion del plumaje',
              'Condicion de las patas', 'Frecuencia respiratoria', 'Deshidratación', 'Actitude')
    question = models.OneToOneField(Question, default='')
    type_animal = models.CharField(max_length=60)
    zootechnical_purpose = models.CharField(max_length=30)
    age = models.CharField(max_length=3, choices=AGE)
    age_week = models.IntegerField()
    age_month = models.IntegerField()
    place = models.CharField(max_length=3, choices=CONFINEMENT)
    quantity = models.IntegerField()
    coexistence = models.NullBooleanField(null=True)
    origin_water = models.CharField(max_length=30)
    morbidity = models.IntegerField()
    mortality = models.IntegerField()
    date_signs = models.CharField(max_length=10)
    water = models.CharField(max_length=3, choices=DRINK)
    eat = models.CharField(max_length=3, choices=FOOD)
    vaccine = models.CharField(max_length=30)
    defecation = models.CharField(max_length=3, choices=DEFECATION)
    condition_corporal = models.CharField(max_length=30)
    plumage = models.CharField(max_length=50)
    condition_legs = models.CharField(max_length=3, choices=DEFECATION)
    breathing_frequency = models.IntegerField()
    dehydration = models.NullBooleanField(null=True)
    attitude = models.CharField(max_length=80)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Bird._meta.fields]


class Wild(models.Model):
    DEFAULT_IMAGE = 'https://www.redjurista.com/AppFolders/Images/News/IMAGENES/agricultura/animales/ani1.JPG'
    FIELDS = ('Pregunta', 'Especie', 'Fin zootécnico', 'Condicion medio ambientales', 'Alimentación',
              'Antecedentes patológicos/hereditarios','Evolución de la enfermedad actual', 'Frecuencia cardiaca',
              'Frecuencia respiratoria', 'Temperatura(C°)', 'Llenado capilar', 'Color de mucosa', 'Linfonodos',
              'Movimientos Ruminales')
    question = models.OneToOneField(Question, default='')
    specie = models.CharField(max_length=30)
    zootechnical = models.CharField(max_length=50)
    ambiental_condition = models.CharField(max_length=80)
    feeding = models.CharField(max_length=50)
    background = models.CharField(max_length=50)
    evolution_disease = models.CharField(max_length=50)
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    capilar = models.IntegerField()
    mucosal_color = models.CharField(max_length=30)
    lymph_nodes = models.CharField(max_length=50)
    ruminal = models.CharField(max_length=80)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Wild._meta.fields]


class Aquatic(models.Model):
    AQRUSTIC = 'RS'
    AQCEMENT = 'ACM'
    AQGEOMEMBRANE = 'GM'
    AQFLOATINGCAGE = 'FC'
    AQOTHER = 'TH'

    POND = (
        (AQRUSTIC, 'Rústico'),
        (AQCEMENT, 'Cemento'),
        (AQGEOMEMBRANE, 'Geomembrana'),
        (AQFLOATINGCAGE, 'Jaula flotante'),
        (AQOTHER, 'Otro'),
    )

    TURBINE = 'ATR'
    PROPELLER = 'APR'
    PALETTE = 'APL'
    VERTICAL = 'AVR'
    AEREATOROTHER = 'TH'

    AEREATOR = (
        (TURBINE, 'Turbina'),
        (PROPELLER, 'Hélice'),
        (PALETTE, 'Paleta'),
        (VERTICAL, 'Flujo vertical'),
        (AEREATOROTHER, 'Otro'),
    )

    BOTTOM = 'BT'
    MIDDLE = 'MD'
    SURFACE = 'SR'

    COLUMNPOSITION = (
        (BOTTOM, 'Fondo'),
        (MIDDLE, 'Medio'),
        (SURFACE, 'Superficie'),
    )

    NORMAL = 'NR'
    LETHARGIC = 'LT'
    ERRATIC = 'RT'
    SPIRAL = 'SP'
    RUB = 'RB'

    FISHMOVEMENT = (
        (NORMAL, 'Normal'),
        (LETHARGIC, 'Letárgico'),
        (ERRATIC, 'Errático'),
        (SPIRAL, 'En espiral'),
        (RUB, 'Se frotan con la superficie del estanque')
    )

    FISHNORMAL = 'NR'
    FISHDARK = 'DR'

    FISHPOPULATIONCOLOR = (
        (FISHNORMAL, 'Normal'),
        (FISHDARK, 'Obscuro'),
    )

    PELLET = 'APL'
    FLAKE = 'AFL'
    LIVE = 'ALV'
    FDOTHER = 'TH'

    FOODTYPE = (
        (PELLET, 'Pellet'),
        (FLAKE, 'Hojuela'),
        (LIVE, 'Vivo'),
        (FDOTHER, 'Otro'),
    )

    FISHCOLOR = (
        (FISHNORMAL, 'Normal'),
        (FISHDARK, 'Obscuro'),
    )

    YES = 'YS'
    NO = 'NO'

    DEFAULT_IMAGE = 'https://img-aws.ehowcdn.com/877x500p/photos.demandstudios.com/getty/article/211/135/136625206.jpg'
    FIELDS = ('Pregunta', 'Grupo genético', 'Fin zootécnico', 'Edad', 'Peso promedio de la población',
              'Tipo de estanque','Densidad','Biomasa', 'Presencia de sistema de aeracion','Presencia de sistema de recirculación de agua',
              'Tipo de aireador', 'Recambio diario de agua', 'Fecha de siembra', 'Temperatura (6 am)', 'Temperatura (3 pm)', 'pH (6 am)', 'pH (3 pm)',
              'Nitritos (NO2)','Amonio (NH4)','Amoniaco (NH3)','Transparencia','Mortandad acumulada','Inicio de la mortandad','Posición de los peces en la columna de agua',
              'Coloración del cuerpo de los peces','Tipo de movimiento de los peces en el agua','Inapetencia','Tipo de alimentación',
              'Cantidad de alimento administrado por día','Coloración','Vientre abultado','Exoftalmia','Petequias en base de aletas',
              'Aletas desilachadas','Úlceras','Llagas en piel','Estructuras algodonosas','Necrosis en capa epidérmica','Opacidad ocular')
    question = models.OneToOneField(Question, default='')
    genetic = models.CharField(max_length=50)
    zootechnical = models.CharField(max_length=50)
    age = models.IntegerField()
    weight = models.IntegerField()
    pond = models.CharField(max_length=3, choices=POND)
    density = models.IntegerField()
    biomass = models.IntegerField()
    aeration = models.NullBooleanField(null=True)
    recirculation_water = models.NullBooleanField(null=True)
    aeration_type = models.CharField(max_length=3, choices=AEREATOR)
    change_water = models.PositiveIntegerField()
    date_sowing = models.CharField(max_length=50)
    temperature_6am = models.IntegerField()
    temperature_3pm = models.IntegerField()
    oxygen_6am = models.IntegerField()
    oxygen_3pm = models.IntegerField()
    ph_6am = models.IntegerField()
    ph_3pm = models.IntegerField()
    no2 = models.IntegerField()
    nh4 = models.IntegerField()
    nh3 = models.IntegerField()
    transparency = models.IntegerField()
    mortality = models.IntegerField()
    start_mortality = models.CharField(max_length=30)
    position = models.CharField(max_length=3, choices=COLUMNPOSITION)
    body_color = models.CharField(max_length=3, choices=FISHPOPULATIONCOLOR)
    moves = models.CharField(max_length=3, choices=FISHMOVEMENT)
    lack_of_appetite = models.NullBooleanField(null=True)
    type_eat = models.CharField(max_length=3, choices=FOODTYPE)
    eat_for_day = models.CharField(max_length=80)
    coloration = models.CharField(max_length=3, choices=FISHCOLOR)
    bulging_belly = models.NullBooleanField(null=True)
    exophthalmia = models.NullBooleanField(null=True)
    petechia = models.NullBooleanField(null=True)
    dilated = models.NullBooleanField(null=True)
    ulcers = models.NullBooleanField(null=True)
    skin_sores = models.NullBooleanField(null=True)
    cotton_structures = models.NullBooleanField(null=True)
    necrosis_epidermal_layer = models.NullBooleanField(null=True)
    ocular_opacity = models.NullBooleanField(null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Aquatic._meta.fields]


class Horse(Specie):
    DEFAULT_IMAGE = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Palomino_Horse.jpg/220px-Palomino_Horse.jpg'
    FIELDS = Specie.FIELDS_S + ('Frecuencia cardiaca', 'frecuencia respiratoria', 'Temperatura(C°)', 'Llenado capilar',
                                'Color de mucosa', 'Linfonodos', 'Condicion corporal')
    heart_rate = models.IntegerField()
    respiratory_rate = models.IntegerField()
    temperature = models.DecimalField(max_digits=5, decimal_places=3)
    capilar = models.IntegerField()
    mucosal_color = models.CharField(max_length=30, null=True)
    lymph_nodes = models.CharField(max_length=50, null=True)
    body_condition = models.TextField(null=True)

    def __str__(self):
        return '%s' % self.id

    def get_fields(self):
        return [(field.name, field.value_to_string(self)) for field in Horse._meta.fields]


class Document(models.Model):
    description = models.CharField(max_length=255, blank=True, null=True)
    document = models.FileField(upload_to='documents/', null=True, blank=True,)
    uploaded_at = models.DateTimeField(auto_now_add=True)
    question = models.ForeignKey(Question, default=None)

    def __str__(self):
        return '%s' % self.document