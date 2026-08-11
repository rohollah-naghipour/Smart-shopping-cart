from decimal import Decimal


PROTEIN_WEIGHT = Decimal("2.0")
FIBER_WEIGHT = Decimal("1.5")
CALORIE_PENALTY = Decimal("0.002")


def calculate_score(product):
    """
    Calculate the nutritional score of a product.

    Expected product structure:

    {
        "price": 900000,
        "calories": 340,
        "protein": 25,
        "fiber": 11,
    }
    """

    price = Decimal(str(product["price"]))
    protein = Decimal(str(product.get("protein", 0)))
    fiber = Decimal(str(product.get("fiber", 0)))
    calories = Decimal(str(product.get("calories", 0)))

    if price <= 0:
        return Decimal("0")

    nutritional_value = (
        protein * PROTEIN_WEIGHT
        + fiber * FIBER_WEIGHT
        - calories * CALORIE_PENALTY
    )

    if nutritional_value < 0:
        nutritional_value = Decimal("0")

    return nutritional_value / price