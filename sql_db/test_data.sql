USE nova;

SET FOREIGN_KEY_CHECKS = 0;

-- =========================================================
-- 1. algorithm_versions
-- =========================================================

INSERT INTO algorithm_versions
(id, version, description, released_at)
VALUES
(
    'alg-0001',
    'v1.0.0',
    'Initial NOVA MVP recommendation algorithm',
    '2026-08-10 09:00:00'
);

-- =========================================================
-- 2. families
-- Budget is IRR
-- =========================================================

INSERT INTO families
(id, name, city, monthly_budget, created_at)
VALUES
(
    'fam-0001',
    'Ahmadi Family',
    'Tehran',
    25000000.00,
    '2026-08-10 09:00:00'
),
(
    'fam-0002',
    'Rahimi Family',
    'Shiraz',
    18000000.00,
    '2026-08-10 09:05:00'
);

-- =========================================================
-- 3. family_members
-- gender:
-- 1 = male
-- 0 = female
-- =========================================================

INSERT INTO family_members
(
    id,
    family_id,
    name,
    age,
    gender,
    height_cm,
    weight_kg,
    activity_level,
    goal
)
VALUES
(
    'mem-0001',
    'fam-0001',
    'Ali',
    35,
    1,
    178.00,
    82.50,
    2,
    1
),
(
    'mem-0002',
    'fam-0001',
    'Sara',
    32,
    0,
    165.00,
    62.00,
    1,
    1
),
(
    'mem-0003',
    'fam-0001',
    'Arman',
    8,
    1,
    128.00,
    28.50,
    2,
    1
),
(
    'mem-0004',
    'fam-0002',
    'Reza',
    40,
    1,
    180.00,
    88.00,
    1,
    1
),
(
    'mem-0005',
    'fam-0002',
    'Mina',
    37,
    0,
    162.00,
    67.00,
    1,
    1
);

-- =========================================================
-- 4. users
-- password values are test hashes/placeholders
-- =========================================================

INSERT INTO users
(
    id,
    family_id,
    email,
    password,
    full_name,
    phone,
    role,
    created_at
)
VALUES
(
    'usr-0001',
    'fam-0001',
    'ali@example.com',
    '$2b$12$TEST_HASH_ALI',
    'Ali Ahmadi',
    '09120000001',
    1,
    '2026-08-10 09:10:00'
),
(
    'usr-0002',
    'fam-0002',
    'reza@example.com',
    '$2b$12$TEST_HASH_REZA',
    'Reza Rahimi',
    '09120000002',
    1,
    '2026-08-10 09:11:00'
);

-- =========================================================
-- 5. categories
-- parent_id creates category tree
-- =========================================================

INSERT INTO categories
(id, parent_id, name, description, thumbnail)
VALUES
(
    'cat-0001',
    NULL,
    'Staple Foods',
    'Basic food products',
    NULL
),
(
    'cat-0002',
    'cat-0001',
    'Rice',
    'Rice products',
    NULL
),
(
    'cat-0003',
    'cat-0001',
    'Pasta',
    'Pasta products',
    NULL
),
(
    'cat-0004',
    NULL,
    'Dairy',
    'Milk and dairy products',
    NULL
),
(
    'cat-0005',
    NULL,
    'Protein',
    'Protein-rich foods',
    NULL
);

-- =========================================================
-- 6. products
-- =========================================================

INSERT INTO products
(
    id,
    sku,
    name,
    brand,
    weight_g,
    image,
    description,
    stock
)
VALUES
(
    'prd-0001',
    'RICE-001',
    'Iranian Rice 1kg',
    'Shirin',
    1000.000,
    NULL,
    'Iranian white rice',
    100
),
(
    'prd-0002',
    'PASTA-001',
    'Pasta 700g',
    'Mana',
    700.000,
    NULL,
    'Wheat pasta',
    200
),
(
    'prd-0003',
    'MILK-001',
    'Milk 1L',
    'Kalleh',
    1000.000,
    NULL,
    'Low-fat milk',
    150
),
(
    'prd-0004',
    'EGG-001',
    'Egg 12 Pack',
    'Local Farm',
    600.000,
    NULL,
    'Fresh eggs',
    80
),
(
    'prd-0005',
    'LENTIL-001',
    'Lentils 900g',
    'Shirin',
    900.000,
    NULL,
    'Dried lentils',
    120
);

-- =========================================================
-- 7. product_categories
-- =========================================================

INSERT INTO product_categories
(id, product_id, category_id)
VALUES
('pc-0001', 'prd-0001', 'cat-0002'),
('pc-0002', 'prd-0002', 'cat-0003'),
('pc-0003', 'prd-0003', 'cat-0004'),
('pc-0004', 'prd-0004', 'cat-0005'),
('pc-0005', 'prd-0005', 'cat-0005'),
('pc-0006', 'prd-0005', 'cat-0001');

-- =========================================================
-- 8. nutrition_profiles
-- =========================================================

INSERT INTO nutrition_profiles
(
    id,
    product_id,
    calories,
    protein,
    fat,
    carbohydrate,
    fiber,
    sugar,
    sodium,
    vitamins,
    minerals
)
VALUES
(
    'nut-0001',
    'prd-0001',
    360.00,
    7.00,
    0.70,
    80.00,
    1.30,
    0.20,
    2.00,
    '{"B1":0.2,"B3":1.6}',
    '{"iron":0.8}'
),
(
    'nut-0002',
    'prd-0002',
    350.00,
    12.00,
    1.50,
    72.00,
    3.00,
    3.00,
    5.00,
    '{"B1":0.4}',
    '{"iron":2.0}'
),
(
    'nut-0003',
    'prd-0003',
    45.00,
    3.20,
    1.50,
    4.80,
    0.00,
    4.80,
    45.00,
    '{"B12":0.4,"D":1.0}',
    '{"calcium":120}'
),
(
    'nut-0004',
    'prd-0004',
    143.00,
    12.60,
    9.50,
    0.70,
    0.00,
    0.40,
    142.00,
    '{"A":160,"B12":1.1}',
    '{"iron":1.8}'
),
(
    'nut-0005',
    'prd-0005',
    340.00,
    25.00,
    1.20,
    60.00,
    11.00,
    2.00,
    6.00,
    '{"B1":0.5}',
    '{"iron":7.5}'
);

-- =========================================================
-- 9. prices
-- Prices are IRR
-- Multiple dates demonstrate price history
-- =========================================================

INSERT INTO prices
(
    id,
    product_id,
    store_name,
    price,
    date,
    currency,
    is_active
)
VALUES
(
    'price-0001',
    'prd-0001',
    'Test Supermarket',
    1250000.00,
    '2026-08-08',
    'IRR',
    0
),
(
    'price-0002',
    'prd-0001',
    'Test Supermarket',
    1350000.00,
    '2026-08-10',
    'IRR',
    1
),
(
    'price-0003',
    'prd-0002',
    'Test Supermarket',
    650000.00,
    '2026-08-10',
    'IRR',
    1
),
(
    'price-0004',
    'prd-0003',
    'Test Supermarket',
    450000.00,
    '2026-08-10',
    'IRR',
    1
),
(
    'price-0005',
    'prd-0004',
    'Test Supermarket',
    850000.00,
    '2026-08-10',
    'IRR',
    1
),
(
    'price-0006',
    'prd-0005',
    'Test Supermarket',
    900000.00,
    '2026-08-10',
    'IRR',
    1
);

-- =========================================================
-- 10. shopping_plans
-- =========================================================

INSERT INTO shopping_plans
(
    id,
    user_id,
    budget,
    total_cost,
    nutrition_score,
    generated_at,
    algorithm_version_id,
    notes
)
VALUES
(
    'plan-0001',
    'usr-0001',
    5000000.00,
    4850000.00,
    82.50,
    '2026-08-10 10:00:00',
    'alg-0001',
    'Initial test shopping plan'
);

-- =========================================================
-- 11. shopping_items
-- =========================================================

INSERT INTO shopping_items
(
    id,
    shopping_plan_id,
    product_id,
    quantity,
    unit_price,
    score,
    subtotal
)
VALUES
(
    'item-0001',
    'plan-0001',
    'prd-0001',
    2.000,
    1350000.00,
    85.00,
    2700000.00
),
(
    'item-0002',
    'plan-0001',
    'prd-0002',
    1.000,
    650000.00,
    75.00,
    650000.00
),
(
    'item-0003',
    'plan-0001',
    'prd-0003',
    1.000,
    450000.00,
    70.00,
    450000.00
),
(
    'item-0004',
    'plan-0001',
    'prd-0004',
    1.000,
    850000.00,
    88.00,
    850000.00
),
(
    'item-0005',
    'plan-0001',
    'prd-0005',
    1.000,
    900000.00,
    92.00,
    900000.00
);

-- =========================================================
-- 12. recommendation_history
-- =========================================================

INSERT INTO recommendation_history
(
    id,
    shopping_plan_id,
    algorithm_version_id,
    generated_at,
    execution_time_ms,
    total_products_considered,
    total_products_selected
)
VALUES
(
    'rec-0001',
    'plan-0001',
    'alg-0001',
    '2026-08-10 10:00:00',
    42,
    5,
    5
);

-- =========================================================
-- 13. recommendation_reasons
-- =========================================================

INSERT INTO recommendation_reasons
(
    id,
    recommendation_history_id,
    product_id,
    reason_type,
    reason_text,
    score,
    priority
)
VALUES
(
    'reason-0001',
    'rec-0001',
    'prd-0005',
    1,
    'High protein and fiber relative to price',
    92.00,
    1
),
(
    'reason-0002',
    'rec-0001',
    'prd-0004',
    2,
    'Good protein source within budget',
    88.00,
    2
),
(
    'reason-0003',
    'rec-0001',
    'prd-0001',
    3,
    'Low-cost staple food',
    85.00,
    3
);

-- =========================================================
-- 14. decision_logs
-- =========================================================

INSERT INTO decision_logs
(
    id,
    recommendation_history_id,
    product_id,
    action,
    reason,
    details,
    created_at
)
VALUES
(
    'decision-0001',
    'rec-0001',
    'prd-0005',
    1,
    'Selected',
    '{"score":92,"budget_fit":true}',
    '2026-08-10 10:00:00'
),
(
    'decision-0002',
    'rec-0001',
    'prd-0004',
    1,
    'Selected',
    '{"score":88,"budget_fit":true}',
    '2026-08-10 10:00:00'
);

SET FOREIGN_KEY_CHECKS = 1;
