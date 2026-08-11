from decimal import Decimal


def optimize_products(products, budget):
    """
    Select products while respecting the available budget.

    products:
        List of products that already contain a calculated score.

    budget:
        Maximum amount available for shopping.
    """

    budget = Decimal(str(budget))
    remaining_budget = budget
    selected_products = []

    # بهترین محصولات ابتدا بررسی می‌شوند
    products = sorted(
        products,
        key=lambda product: product["score"],
        reverse=True,
    )

    for product in products:
        price = Decimal(str(product["price"]))

        if price <= 0:
            continue

        if price <= remaining_budget:
            selected_products.append(
                {
                    "product_id": product["id"],
                    "name": product["name"],
                    "price": price,
                    "quantity": 1,
                }
            )

            remaining_budget -= price

    return {
        "items": selected_products,
        "total_cost": budget - remaining_budget,
        "remaining_budget": remaining_budget,
    }