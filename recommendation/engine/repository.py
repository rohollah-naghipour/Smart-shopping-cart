from django.db import connection


def get_available_products():
    query = """
        SELECT
            p.id,
            p.name,
            p.brand,
            p.weight_g,
            p.stock,

            MIN(pc.category_id) AS category_id,

            pr.price,

            np.calories,
            np.protein,
            np.fat,
            np.carbohydrate,
            np.fiber,
            np.sugar,
            np.sodium

        FROM products AS p

        LEFT JOIN product_categories AS pc
            ON pc.product_id = p.id

        INNER JOIN prices AS pr
            ON pr.product_id = p.id
            AND pr.is_active = 1

        INNER JOIN nutrition_profiles AS np
            ON np.product_id = p.id

        WHERE p.stock > 0

        GROUP BY
            p.id,
            p.name,
            p.brand,
            p.weight_g,
            p.stock,
            pr.price,
            np.calories,
            np.protein,
            np.fat,
            np.carbohydrate,
            np.fiber,
            np.sugar,
            np.sodium

        ORDER BY p.id;
    """

    with connection.cursor() as cursor:
        cursor.execute(query)

        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()

    return [
        dict(zip(columns, row))
        for row in rows
    ]