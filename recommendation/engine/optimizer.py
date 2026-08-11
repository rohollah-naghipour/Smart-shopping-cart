from decimal import Decimal


def optimize_products(
    products: list[dict],
    budget: Decimal,
) -> list[dict]:
    
    sorted_products = sorted(
        products,
        key=lambda product: product["score"],
        reverse=True,
    )

    selected = []
    total_cost = Decimal("0")

    for product in sorted_products:
        price = Decimal(str(product["price"]))

        if total_cost + price > budget:
            continue

        selected.append(product)
        total_cost += price

    return selected