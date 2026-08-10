from django.urls import path

from .views import (ShoppingPlanListAPIView,
ShoppingPlanDetailAPIView,
ShoppingItemListAPIView,
)

urlpatterns = [
    path("api/v1/shopping-plans", ShoppingPlanListAPIView.as_view(),
         name="shopping-plan-list",),

    path("api/v1/shopping-plans/<str:pk>/", ShoppingPlanDetailAPIView.as_view(),
         name="shopping-plan-detail",),

    path("api/v1/shopping-plans/<str:plan_id>/items/", ShoppingItemListAPIView.as_view(),
         name="shopping-item-list",),
]