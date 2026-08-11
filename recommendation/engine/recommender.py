from decimal import Decimal

from .scorer import calculate_score
from .optimizer import optimize_products


def generate_recommendation(products, budget):
    """
    Generate a shopping recommendation.

    Steps:
    1. Calculate score for every product.
    2. Send scored products to optimizer.
    3. Return the optimized shopping plan.
    """

    budget = Decimal(str(budget))

    scored_products = []

    for product in products:
        product_copy = product.copy()

        product_copy["score"] = calculate_score(product_copy)

        scored_products.append(product_copy)

    result = optimize_products(
        products=scored_products,
        budget=budget,
    )

    return {
        "budget": budget,
        "total_cost": result["total_cost"],
        "remaining_budget": result["remaining_budget"],
        "items": result["items"],
    }