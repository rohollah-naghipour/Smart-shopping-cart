from django.db import models


class AlgorithmVersion(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    version = models.CharField(max_length=50)
    description = models.TextField(null=True, blank=True)
    released_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "algorithm_versions"


class RecommendationHistory(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    shopping_plan_id = models.CharField(max_length=36)
    algorithm_version_id = models.CharField(max_length=36)

    generated_at = models.DateTimeField()

    execution_time_ms = models.IntegerField()

    total_products_considered = models.IntegerField()
    total_products_selected = models.IntegerField()

    class Meta:
        managed = False
        db_table = "recommendation_history"


class RecommendationReason(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    recommendation_history_id = models.CharField(max_length=36)
    product_id = models.CharField(max_length=36)

    reason_type = models.SmallIntegerField()

    reason_text = models.TextField()

    score = models.DecimalField(
        max_digits=6,
        decimal_places=2,
        null=True,
        blank=True,
    )

    priority = models.SmallIntegerField(default=1)

    class Meta:
        managed = False
        db_table = "recommendation_reasons"


class DecisionLog(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    recommendation_history_id = models.CharField(max_length=36)
    product_id = models.CharField(max_length=36)

    action = models.SmallIntegerField()

    reason = models.CharField(
        max_length=255,
        null=True,
        blank=True,
    )

    details = models.JSONField(
        null=True,
        blank=True,
    )

    created_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "decision_logs"