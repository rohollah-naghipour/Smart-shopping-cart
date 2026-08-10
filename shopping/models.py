from django.db import models


class ShoppingPlan(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    user_id = models.CharField(max_length=36)

    budget = models.DecimalField(
        max_digits=18,
        decimal_places=2,
    )

    total_cost = models.DecimalField(
        max_digits=18,
        decimal_places=2,
    )

    nutrition_score = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        null=True,
        blank=True,
    )

    generated_at = models.DateTimeField()

    algorithm_version_id = models.CharField(max_length=36)

    notes = models.TextField(
        null=True,
        blank=True,
    )

    class Meta:
        managed = False
        db_table = "shopping_plans"


class ShoppingItem(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    shopping_plan_id = models.CharField(max_length=36)

    product_id = models.CharField(max_length=36)

    quantity = models.DecimalField(
        max_digits=10,
        decimal_places=3,
    )

    unit_price = models.DecimalField(
        max_digits=18,
        decimal_places=2,
    )

    score = models.DecimalField(
        max_digits=6,
        decimal_places=2,
        null=True,
        blank=True,
    )

    subtotal = models.DecimalField(
        max_digits=18,
        decimal_places=2,
    )

    class Meta:
        managed = False
        db_table = "shopping_items"