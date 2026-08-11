from decimal import Decimal

from .repository import get_available_products
from .scorer import calculate_score
from .optimizer import optimize_products


def generate_recommendation(budget):
    """
    Generate a recommendation using real database products.
    """

    budget = Decimal(str(budget))

    products = get_available_products()

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