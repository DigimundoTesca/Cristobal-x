# Large Species
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


MALE = 'ML'
FEMALE = 'FM'

SEX = (
  (MALE, 'Macho'),
  (FEMALE, 'Hembra'),
  )

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

# Bees tuples

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

PRESENT = 'PS'
NOTPRESENT = 'NT'
NOTVERIFIED = 'NV'

QUEEN = (
  (PRESENT,'Presente'),
  (NOTPRESENT, 'No Presente'),
  (NOTVERIFIED, 'No Verificado'),
  )

LARVACOLOR = 'BC'
PERFORATED = 'PR'
FATTY = 'FT'
APRICOTS = 'APR'
NOTVERIFIED = 'NV'

LARVA = (
  (LARVACOLOR, 'Larvas de color anormal'),
  (PERFORATED, 'Perforadas'),
  (FATTY, 'Aspecto grasoso'),
  (APRICOTS, 'Opérculos raídos'),
  (NOTVERIFIED, 'No Verificado'),
  )

STOMACH = 'ST'
SLOW = 'SL'
CHOP = 'CH'
ALOPECIA = 'LP'
SHINY = 'SH'
NOTVERIFIED = 'NV'

ADULTBEES = (
  (STOMACH, 'Abdomen distendido'),
  (SLOW, 'Lentas'),
  (CHOP, 'Pérdida del instinto de picar'),
  (ALOPECIA, 'Alopécicas'),
  (SHINY, 'Brillosas'),
  (NOTVERIFIED, 'No Verificado'),
  )

EXCREMENT = (
  (PRESENT, 'Presente'),
  (NOTPRESENT, 'No Presente'),
  (NOTVERIFIED, 'NO Verificado'),
  )

LARVA = (
  (PRESENT, 'Presente'),
  (NOTPRESENT, 'No Presente'),
  (NOTVERIFIED, 'NO Verificado'),
  )

DEADBEES = (
  (PRESENT, 'Presente'),
  (NOTPRESENT, 'No Presente'),
  (NOTVERIFIED, 'NO Verificado'),
  )

# Birds tuples

YOUNG = 'YN'
ADULT = 'SL'

# Add int fiel to put age in number
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

# Wildlife doesn´t require tuples

# Aquatic organisms tuples

AQFATTEN = 'FT'
AQREPRODUCTIVE = 'RP'
ORNAMENTAL = 'RN'

AQZOOTECHNICAL = (
  (AQFATTEN, 'Engorda'),
  (AQREPRODUCTIVE, 'Reproductores'),
  (ORNAMENTAL, 'Ornamentales'),
  )

AQRUSTIC = 'RS'
AQCEMENT = 'CM'
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

AERATION = (
  (YES, 'Si'),
  (NO, 'No'),
  )

RECIRCULATION = (
  (YES, 'Si'),
  (NO, 'No'),
  )

TURBINE = 'TR'
PROPELLER = 'PR'
PALETTE = 'PL'
VERTICAL = 'VR'
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

LACKAPPETITE = (
  (YES, 'Si'),
  (NO, 'No'),
  )

PELLET = 'PL'
FLAKE = 'FL'
LIVE = 'LV'
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

BULGING_BELLY = (
  (YES, 'Si'),
  (NO, 'No'),
  )

EXOPHTALMIA = (
  (YES, 'Si'),
  (NO, 'No'),
  )

PETECHIA = (
  (YES, 'Si'),
  (NO, 'No'),
  )

# Aletas
FIN = (
  (YES, 'Si'),
  (NO, 'No'),
  )

ULCERS = (
  (YES, 'Si'),
  (NO, 'No'),
  )

SORES = (
  (YES, 'Si'),
  (NO, 'No'),
  )

COTTON_STRUCTURE = (
  (YES, 'Si'),
  (NO, 'No'),
  )

NECROSIS = (
  (YES, 'Si'),
  (NO, 'No'),
  )

EYE_OPACITY = (
  (YES, 'Si'),
  (NO, 'No'),
  )