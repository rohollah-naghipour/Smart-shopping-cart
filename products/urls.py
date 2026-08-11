from django.urls import path

from .views import ProductListAPIView, ProductAPIView


urlpatterns = [
    path("api/v1/products/", ProductListAPIView.as_view(), 
         name="product-list"),
    path("api/v1/Product/<str:pk>/", ProductAPIView.as_view(),
          name="test_pk_product")

]

