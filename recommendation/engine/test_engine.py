from decimal import Decimal

from .recommender import generate_recommendation


products = [
    {
        "id": "prd-0001",
        "price": Decimal("1350000"),
        "calories": Decimal("360"),
        "protein": Decimal("7"),
        "fiber": Decimal("1.3"),
    },
    {
        "id": "prd-0004",
        "price": Decimal("850000"),
        "calories": Decimal("143"),
        "protein": Decimal("12.6"),
        "fiber": Decimal("0"),
    },
    {
        "id": "prd-0005",
        "price": Decimal("900000"),
        "calories": Decimal("340"),
        "protein": Decimal("25"),
        "fiber": Decimal("11"),
    },
]


result = generate_recommendation(
    products=products,
    budget=Decimal("3000000"),
)

for product in result:
    print(product)