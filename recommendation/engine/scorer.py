from decimal import Decimal


def calculate_product_score(
    price: Decimal,
    calories: Decimal,
    protein: Decimal,
    fiber: Decimal,
) -> Decimal:
    """
    Calculate a simple MVP score for a food product.

    Higher protein and fiber increase the score.
    Higher price and calories reduce the score.
    """

    if price <= 0:
        return Decimal("0")

    protein_score = protein * Decimal("4")
    fiber_score = fiber * Decimal("3")
    calorie_penalty = calories / Decimal("100")
    price_penalty = price / Decimal("100000")

    score = (
        protein_score
        + fiber_score
        - calorie_penalty
        - price_penalty
    )

    return max(
        Decimal("0"),
        score.quantize(Decimal("0.01")),
    )