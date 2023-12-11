from django.urls import path

from project.core.api.v1.views import HealthAPIView


urlpatterns = [
    path("health/", HealthAPIView.as_view(), name="django_health_check"),
]
