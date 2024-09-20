import factory

from e_commerce.core.models import Image


class ImageFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Image

    image = factory.django.ImageField(filename="test_image.jpg")
