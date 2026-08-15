from django.urls import path

from .views import *


urlpatterns = [
    path("api/v1/families/", FamilyListAPIView.as_view(), 
         name="family-list"),
    path("api/v1/families/<str:pk>/", FamilyDetailAPIView.as_view(), 
         name="family-detail"), 
    path("api/v1/families/create/", FamilyCreateAPIView.as_view(), name="family-create"),

     path("api/v1/test/", TestAPIView.as_view(), name="test"),

]
