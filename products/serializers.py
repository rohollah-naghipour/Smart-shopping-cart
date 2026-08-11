from rest_framework import serializers

from .models import Product


class ProductListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            "id",
            "sku",
            "name",
            "brand",
            "weight_g",
            "image",
            "description",
            "stock",
        ]

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['sku',
                   'name', 
                   'brand', 
                   'weight_g',
                   'description']

