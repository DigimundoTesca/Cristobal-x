import time
from .models import User


def caducated_user(y,m,d,pk):
    year = int(time.strftime("%y"))
    month = int(time.strftime("%m"))
    day = int(time.strftime("%d"))
    user = User.objects.filter(pk=pk)
    if y <= year:
        if m <= month:
            if d < day:
                return True
            else:
                user.is_active = False
        else:
            user.is_active = False
    else:
        user.is_active = False
