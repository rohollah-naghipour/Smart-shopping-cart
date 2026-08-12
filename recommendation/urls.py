from django.urls import path
from .views import RecommendationAPIView

urlpatterns = [
    path("api/recommendations/", RecommendationAPIView.as_view(), name="Recommendation"),
]
