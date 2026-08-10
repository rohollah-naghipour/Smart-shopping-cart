from rest_framework import generics

from .models import Family
from .serializers import FamilySerializer


class FamilyListAPIView(generics.ListAPIView):
    queryset = Family.objects.all().prefetch_related("members")
    serializer_class = FamilySerializer


class FamilyDetailAPIView(generics.RetrieveAPIView):
    queryset = Family.objects.all().prefetch_related("members")
    serializer_class = FamilySerializer