

from rest_framework import serializers


class RecommendationRequestSerializer(serializers.Serializer):
    family_id = serializers.CharField(max_length=36)

    budget = serializers.DecimalField(
        max_digits=18,
        decimal_places=2,
        min_value=0,
    )
