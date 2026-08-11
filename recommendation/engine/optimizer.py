from decimal import Decimal


def optimize_products(products, budget):
    """
    MVP Recommendation Optimizer - Version 2

    محصولات را بر اساس امتیاز انتخاب می‌کند،
    اما از انتخاب بیش از حد محصولات جلوگیری می‌کند.
    """

    budget = Decimal(str(budget))
    remaining_budget = budget
    selected_products = []

    sorted_products = sorted(
        products,
        key=lambda product: product["score"],
        reverse=True,
    )

    for product in sorted_products:

        price = Decimal(str(product["price"]))

        if price <= 0:
            continue

        if price > remaining_budget:
            continue

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