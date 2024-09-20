from django.core.mail import EmailMessage

from celery import shared_task
from rest_framework.generics import get_object_or_404

from e_commerce.products.models import Product, Review


@shared_task
def send_review_email(review_id):
    review = get_object_or_404(Review, id=review_id)
    product = get_object_or_404(Product, id=review.product.id)

    subject = f'Product {product.name} Received review from customer {review.customer.email}'
    content = (f'Feedback on {product.name}: '
               f'Rating: {review.rating}.'
               f'Comment: {review.comment}.'
    )

    try:
        response = EmailMessage(subject=subject, body=content, to=[product.user.email])
        response.content_subtype = "html"
        response.send()
    except Exception:
        pass
