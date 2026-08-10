from django.db import models


class Family(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    name = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    monthly_budget = models.DecimalField(
        max_digits=18,
        decimal_places=2,
    )
    created_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "families"

    def __str__(self):
        return self.name


class FamilyMember(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    family = models.ForeignKey(
        Family,
        on_delete=models.CASCADE,
        db_column="family_id",
        related_name="members",
    )

    name = models.CharField(max_length=100)
    age = models.IntegerField()
    gender = models.BooleanField()

    height_cm = models.DecimalField(
        max_digits=5,
        decimal_places=2,
    )

    weight_kg = models.DecimalField(
        max_digits=6,
        decimal_places=2,
    )

    activity_level = models.SmallIntegerField()
    goal = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = "family_members"

    def __str__(self):
        return self.name


class User(models.Model):
    id = models.CharField(max_length=36, primary_key=True)

    family = models.ForeignKey(
        Family,
        on_delete=models.CASCADE,
        db_column="family_id",
        related_name="users",
    )

    email = models.EmailField(max_length=160)
    password = models.CharField(max_length=255)

    full_name = models.CharField(
        max_length=150,
        null=True,
        blank=True,
    )

    phone = models.CharField(
        max_length=30,
        null=True,
        blank=True,
    )

    role = models.SmallIntegerField(default=1)
    created_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = "users"

    def __str__(self):
        return self.email