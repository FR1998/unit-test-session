from rest_framework import generics, status, filters
from rest_framework.filters import OrderingFilter
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from e_commerce.products.api.v1.serializers import ProductSerializer, ReviewSerializer, ProductListCreateSerializer
from e_commerce.products.models import Product, Review
from e_commerce.products.tasks import send_review_email


class ReviewCreateAPIView(generics.CreateAPIView):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

    def perform_create(self, serializer):
        review = serializer.save()
        send_review_email.delay(review.id)

    def create(self, request, *args, **kwargs):
        super().create(request, *args, **kwargs)
        return Response({"message": "Review created and email sent"}, status=status.HTTP_201_CREATED)


class ProductListCreateAPIView(generics.ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductListCreateSerializer
    filter_backends = [filters.SearchFilter, OrderingFilter]
    search_fields = ["name", "brand"]
    ordering_fields = ["price", "status", "name"]


class ProductRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
