from rest_framework import serializers

from .models import ShoppingPlan, ShoppingItem


class ShoppingItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoppingItem
        fields = [
            "id",
            "shopping_plan_id",
            "product_id",
            "quantity",
            "unit_price",
            "score",
            "subtotal",
        ]


class ShoppingPlanSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoppingPlan
        fields = [
            "id",
            "user_id",
            "budget",
            "total_cost",
            "nutrition_score",
            "generated_at",
            "algorithm_version_id",
            "notes",
        ]
