from django.urls import path

from .views import (
    ShoppingPlanListAPIView,
    ShoppingPlanDetailAPIView,
    ShoppingItemListAPIView,
)


urlpatterns = [
    path(
        "",
        ShoppingPlanListAPIView.as_view(),
        name="shopping-plan-list",
    ),

    path(
        "<str:pk>/",
        ShoppingPlanDetailAPIView.as_view(),
        name="shopping-plan-detail",
    ),

    path(
        "<str:plan_id>/items/",
        ShoppingItemListAPIView.as_view(),
        name="shopping-item-list",
    ),
]
