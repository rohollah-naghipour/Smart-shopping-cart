
from products.models import Product
from products.serializers import ProductListSerializer, ProductSerializer

from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status


import logging

logger = logging.getLogger(__name__)


class ProductListAPIView(generics.ListAPIView):
    queryset = Product.objects.all().order_by("name")
    serializer_class = ProductListSerializer


class ProductAPIView(APIView):
    def get(self, request, pk):
        try: 
            product = Product.objects.get(pk=pk)

            print(product)

            serializer = ProductSerializer(product)
            #print(serializer)

            return Response(serializer.data,  status=status.HTTP_200_OK)
        except Product.DoesNotExist:
            return Response(
                 {'error': f'Product with ID {pk} not found'}, 
                status=status.HTTP_404_NOT_FOUND
            )
        
