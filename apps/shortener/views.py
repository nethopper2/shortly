from django.shortcuts import render
from django.views.generic import TemplateView


# Create your views here.
class ListView(TemplateView):
    template_name = "shortener/list.html"

