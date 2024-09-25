from rest_framework import serializers

from e_commerce.products.models import Product, Review


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        exclude = ["user"]


class ProductListCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = "__all__"


class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = '__all__'
