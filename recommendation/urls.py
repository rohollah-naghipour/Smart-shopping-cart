
from django.urls import path

from .views import RecommendationAPIView



urlpatterns = [
    path("api/v1/recommendation", RecommendationAPIView.as_view(),
          name="Recommendation"),      
]


