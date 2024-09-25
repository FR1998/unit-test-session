from django.db import models

from e_commerce.products.choices import ProductStatus


class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=50, choices=ProductStatus.choices, default=ProductStatus.AVAILABLE)
    sku = models.CharField(max_length=100, unique=True)
    stock = models.PositiveIntegerField(default=0)
    brand = models.CharField(max_length=255, null=True, blank=True)
    weight = models.DecimalField(max_digits=6, decimal_places=2, null=True, blank=True)
    date_added = models.DateTimeField(auto_now_add=True)
    expiry_date = models.DateTimeField(null=True, blank=True)

    image = models.ForeignKey("core.Image", on_delete=models.CASCADE, related_name="products", null=True, blank=True)
    user = models.ForeignKey("users.User", on_delete=models.CASCADE, related_name="products")

    def __str__(self):
        return self.name


class Review(models.Model):
    rating = models.IntegerField()
    comment = models.TextField()

    customer = models.ForeignKey("users.User", on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return f'Review for {self.product.name} by {self.customer.email}'
