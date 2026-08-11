from decimal import Decimal

from .optimizer import optimize_products
from .scorer import calculate_product_score


def generate_recommendation(
    products: list[dict],
    budget: Decimal,
) -> list[dict]:

    scored_products = []

    for product in products:
        score = calculate_product_score(
            price=Decimal(str(product["price"])),
            calories=Decimal(str(product["calories"])),
            protein=Decimal(str(product["protein"])),
            fiber=Decimal(str(product["fiber"])),
        )

        scored_products.append(
            {
                **product,
                "score": score,
            }
        )

    return optimize_products(
        products=scored_products,
        budget=budget,
    )