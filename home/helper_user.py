from home.models import Question


class UserHelper(object):
    def __init__(self):
        super(UserHelper, self).__init__()
        self.__all_questions = None
        self.__avg = None

    def get_all_questions(self, pk_user):
        if self.__all_questions is None:
            self.set_all_questions(pk_user)
        return self.__all_questions

    def set_all_questions(self, pk_user):
        self.__all_questions = Question.objects.filter(user_response=pk_user)

    def get_avg(self, pk_user):
        if self.__avg is None:
            self.set_avg(pk_user)
        return self.__avg

    def set_avg(self, pk_user):
        questions = self.get_all_questions(pk_user)
        califications = []
        for question in questions:
            califications.append(question.calification)
        avg = sum(califications)/len(califications)
        self.__avg = avg