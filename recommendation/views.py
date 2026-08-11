from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializers import RecommendationRequestSerializer
from .engine.recommender import generate_recommendation


class RecommendationAPIView(APIView):

    def post(self, request):
        serializer = RecommendationRequestSerializer(
            data=request.data
        )

        serializer.is_valid(raise_exception=True)

        family_id = serializer.validated_data["family_id"]
        budget = serializer.validated_data["budget"]

        recommendation = generate_recommendation(budget)

        return Response(
            {
                "family_id": family_id,
                "budget": recommendation["budget"],
                "total_cost": recommendation["total_cost"],
                "remaining_budget": recommendation["remaining_budget"],
                "items": recommendation["items"],
            },
            status=status.HTTP_200_OK,
        )