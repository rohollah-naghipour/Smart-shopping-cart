from django.db import models


class Product(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    sku = models.CharField(max_length=100, unique=True)
    name = models.CharField(max_length=200)
    brand = models.CharField(max_length=100, null=True, blank=True)

    weight_g = models.DecimalField(
        max_digits=13,
        decimal_places=3,
    )

    image = models.CharField(max_length=255, null=True, blank=True)
    description = models.TextField(null=True, blank=True)

    stock = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = "products"

    def __str__(self):
        return self.name


class Category(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    parent = models.ForeignKey(
        "self",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column="parent_id",
        related_name="children",
    )

    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    thumbnail = models.CharField(
        max_length=255,
        null=True,
        blank=True,
    )

    class Meta:
        managed = False
        db_table = "categories"

    def __str__(self):
        return self.name


class ProductCategory(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        db_column="product_id",
        related_name="product_categories",
    )

    category = models.ForeignKey(
        Category,
        on_delete=models.CASCADE,
        db_column="category_id",
        related_name="product_categories",
    )

    class Meta:
        managed = False
        db_table = "product_categories"


class NutritionProfile(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    product = models.OneToOneField(
        Product,
        on_delete=models.CASCADE,
        db_column="product_id",
        related_name="nutrition",
    )

    calories = models.DecimalField(max_digits=10, decimal_places=2)
    protein = models.DecimalField(max_digits=10, decimal_places=2)
    fat = models.DecimalField(max_digits=10, decimal_places=2)
    carbohydrate = models.DecimalField(max_digits=10, decimal_places=2)
    fiber = models.DecimalField(max_digits=10, decimal_places=2)
    sugar = models.DecimalField(max_digits=10, decimal_places=2)
    sodium = models.DecimalField(max_digits=10, decimal_places=2)

    vitamins = models.JSONField(null=True, blank=True)
    minerals = models.JSONField(null=True, blank=True)

    class Meta:
        managed = False
        db_table = "nutrition_profiles"


class Price(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        db_column="product_id",
        related_name="prices",
    )

    store_name = models.CharField(max_length=150)
    price = models.DecimalField(max_digits=18, decimal_places=2)

    date = models.DateField()

    currency = models.CharField(max_length=3, default="IRR")
    is_active = models.BooleanField(default=True)

    class Meta:
        managed = False
        db_table = "prices"