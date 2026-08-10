from rest_framework import generics

from .models import ShoppingPlan, ShoppingItem
from .serializers import (
    ShoppingPlanSerializer,
    ShoppingItemSerializer,
)


class ShoppingPlanListAPIView(generics.ListAPIView):
    queryset = ShoppingPlan.objects.all().order_by("-generated_at")
    serializer_class = ShoppingPlanSerializer


class ShoppingPlanDetailAPIView(generics.RetrieveAPIView):
    queryset = ShoppingPlan.objects.all()
    serializer_class = ShoppingPlanSerializer


class ShoppingItemListAPIView(generics.ListAPIView):
    serializer_class = ShoppingItemSerializer

    def get_queryset(self):
        return ShoppingItem.objects.filter(
            shopping_plan_id=self.kwargs["plan_id"]
        )