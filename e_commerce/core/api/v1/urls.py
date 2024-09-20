from django.urls import path

from e_commerce.core.api.v1.views import HealthAPIView


urlpatterns = [
    path("health/", HealthAPIView.as_view(), name="django_health_check"),
]
