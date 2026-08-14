from django.urls import path

from .views import ProductListAPIView, ProductAPIView


urlpatterns = [
    path("api/v1/products/", ProductListAPIView.as_view(), 
         name="product-list"),
     path("api/v1/products/<str:pk>/", ProductAPIView.as_view(),
           name="product-detail"),
]

