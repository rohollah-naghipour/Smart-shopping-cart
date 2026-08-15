
from families.models import Family
from families.serializers import *

from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status



class FamilyListAPIView(generics.ListAPIView):
    queryset = Family.objects.all().prefetch_related("members")
    serializer_class = FamilySerializer


class FamilyDetailAPIView(generics.RetrieveAPIView):
    queryset = Family.objects.all().prefetch_related("members")
    serializer_class = FamilySerializer


from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import transaction
from .models import Family
from .serializers import FamilyCreateSerializer

class FamilyCreateAPIView(APIView):
    def post(self, request):
        serializer = FamilyCreateSerializer(data=request.data)
        
        if not serializer.is_valid():
            return Response(
                {
                    "success": False,
                    "errors": serializer.errors
                },
                status=status.HTTP_400_BAD_REQUEST
            )
        
        try:
            with transaction.atomic():
                family = serializer.save()
                
                return Response(
                    {
                        "success": True,
                        "message": "خانواده با موفقیت ایجاد شد",
                        "data": {
                            "id": family.id,
                            "name": family.name,
                            "city": family.city,
                            "monthly_budget": family.monthly_budget,
                        }
                    },
                    status=status.HTTP_201_CREATED
                )
                
        except Exception as e:
            return Response(
                {
                    "success": False,
                    "message": f"خطا در ایجاد خانواده: {str(e)}"
                },
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        

class TestAPIView(APIView):
    def post(self, request):
        return Response(
            {
                "success": True,
                "massege": "post method is work",
                "data": request.data
            },
            status=status.HTTP_200_OK
        )