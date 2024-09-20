from django.urls import path

from e_commerce.products.api.v1.views import ProductRetrieveUpdateDestroyAPIView, ProductListCreateAPIView, \
    ReviewCreateAPIView

urlpatterns = [
    path("list-create/", ProductListCreateAPIView.as_view(), name="product_list_create"),
    path("<int:pk>/", ProductRetrieveUpdateDestroyAPIView.as_view(), name="slides_retrieve_update_delete"),
    path("review/create/", ReviewCreateAPIView.as_view(), name="review_create"),
]
