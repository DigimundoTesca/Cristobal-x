from django.shortcuts import render
from chat.models import Room
from django.contrib.auth.decorators import login_required


@login_required
def chat_room(request):
    """
    Root page view. This is essentially a single-page app, if you ignore the
    login and admin parts.
    """
    # Get a list of rooms, ordered alphabetically
    rooms = Room.objects.order_by("title")

    # Render that in the index template
    return render(request, "room.html", {
        "rooms": rooms,
    })
