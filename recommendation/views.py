from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializers import RecommendationRequestSerializer


class RecommendationAPIView(APIView):

    def post(self, request):
        serializer = RecommendationRequestSerializer(
            data=request.data
        )

        serializer.is_valid(raise_exception=True)

        family_id = serializer.validated_data["family_id"]
        budget = serializer.validated_data["budget"]

        # Recommendation Engine will be connected here.

        return Response(
            {
                "message": "Recommendation request received.",
                "family_id": family_id,
                "budget": budget,
            },
            status=status.HTTP_200_OK,
        )