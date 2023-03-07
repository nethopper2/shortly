from django.urls import path

from .views import ListView

urlpatterns = [
    path("list/", ListView.as_view(), name="list_shorts"),
]
