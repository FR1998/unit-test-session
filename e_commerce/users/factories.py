import factory

from django.contrib.auth import get_user_model

User = get_user_model()


class UserFactory(factory.django.DjangoModelFactory):
    _email_counter = 0

    @factory.lazy_attribute
    def email(self):
        UserFactory._email_counter += 1
        return f"user{UserFactory._email_counter}@example.com"

    first_name = "John"
    last_name = "Doe"

    class Meta:
        model = User
