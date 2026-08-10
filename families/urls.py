from django.urls import path

from .views import FamilyDetailAPIView, FamilyListAPIView


urlpatterns = [
    path("api/v1/families/", FamilyListAPIView.as_view(), 
         name="family-list"),
    path("api/v1/families/<str:pk>/", FamilyDetailAPIView.as_view(), 
         name="family-detail"),

]
