from background_task import background
from .models import Question

@background(schedule=10)
def time_on_emails(user_id):
    preguntas = Question.objects.all()
    # Iterar entre tiempo de preguntas

    