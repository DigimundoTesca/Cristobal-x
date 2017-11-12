from django.shortcuts import render
from chat.models import Room
from django.contrib.auth.decorators import login_required

@login_required
def chat_room(request, id):    
    rooms = Room.objects.order_by("title")
    template = "chat/room.html"
    context = {
    	"id":id,
        "rooms": rooms,
    }

    return render(request,template,context)
