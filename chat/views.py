from django.shortcuts import render
from chat.models import Room
from django.contrib.auth.decorators import login_required

@login_required
def chat_room(request):    
    rooms = Room.objects.order_by("title")
    template = "chat/room.html"
    context = {
        "rooms": rooms,
    }

    return render(request,template,context)
