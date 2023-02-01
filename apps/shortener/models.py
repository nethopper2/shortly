from django.db import models


class URL(models.Model):
    key = models.CharField(max_length=30)
    target_url = models.CharField(max_length=255)
    is_active = models.BooleanField(default=False)
    clicks = models.IntegerField()
