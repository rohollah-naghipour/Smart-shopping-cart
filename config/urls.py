
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    
    path('', include('products.urls')),
    path('', include('families.urls')),
    path('', include('shopping.urls')),
    path('', include('recommendation.urls')),
    
    path('admin/', admin.site.urls),
]
