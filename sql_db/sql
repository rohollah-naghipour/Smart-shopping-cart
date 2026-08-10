-- ============================================================
-- NOVA MVP - MySQL Database Schema (Converted)
-- ============================================================

-- ============================================================
-- 1. FAMILIES
-- ============================================================

CREATE TABLE families (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    name VARCHAR(100) NOT NULL,

    city VARCHAR(100) NOT NULL,

    monthly_budget DECIMAL(18,2) NOT NULL
        CHECK (monthly_budget >= 0),

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_families_name_city
        UNIQUE (name, city)
);

-- ============================================================
-- 2. FAMILY MEMBERS
-- ============================================================

CREATE TABLE family_members (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    family_id CHAR(36) NOT NULL,
    
    name VARCHAR(100) NOT NULL,

    age INT NOT NULL
        CHECK (age >= 0 AND age <= 150),

    gender BOOLEAN NOT NULL,

    height_cm DECIMAL(5,2) NOT NULL
        CHECK (height_cm > 0),

    weight_kg DECIMAL(6,2) NOT NULL
        CHECK (weight_kg > 0),

    activity_level SMALLINT NOT NULL,

    goal SMALLINT NOT NULL,

    CONSTRAINT uq_family_members_family_name
        UNIQUE (family_id, name),
        
    CONSTRAINT fk_family_members_family
        FOREIGN KEY (family_id) 
        REFERENCES families(id) 
        ON DELETE CASCADE
);

-- ============================================================
-- 3. USERS
-- ============================================================

CREATE TABLE users (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    family_id CHAR(36) NOT NULL,

    email VARCHAR(160) NOT NULL,

    password VARCHAR(255) NOT NULL,

    full_name VARCHAR(150),

    phone VARCHAR(30),

    role SMALLINT NOT NULL DEFAULT 1,

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_users_email
        UNIQUE (email),
        
    CONSTRAINT fk_users_family
        FOREIGN KEY (family_id) 
        REFERENCES families(id) 
        ON DELETE CASCADE
);

-- ============================================================
-- 4. ALGORITHM VERSIONS
-- ============================================================

CREATE TABLE algorithm_versions (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    version VARCHAR(50) NOT NULL,

    description TEXT,

    released_at TIMESTAMP NOT NULL,

    CONSTRAINT uq_algorithm_versions_version
        UNIQUE (version)
);

-- ============================================================
-- 5. SHOPPING PLANS
-- ============================================================

CREATE TABLE shopping_plans (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    user_id CHAR(36) NOT NULL,

    budget DECIMAL(18,2) NOT NULL
        CHECK (budget >= 0),

    total_cost DECIMAL(18,2) NOT NULL DEFAULT 0
        CHECK (total_cost >= 0),

    nutrition_score DECIMAL(10,2),

    generated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    algorithm_version_id CHAR(36) NOT NULL,

    notes TEXT,
    
    CONSTRAINT fk_shopping_plans_user
        FOREIGN KEY (user_id) 
        REFERENCES users(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_shopping_plans_algorithm
        FOREIGN KEY (algorithm_version_id) 
        REFERENCES algorithm_versions(id)
);

-- ============================================================
-- 6. CATEGORIES
-- ============================================================

CREATE TABLE categories (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    parent_id CHAR(36) NULL,

    name VARCHAR(100) NOT NULL,

    description TEXT,

    thumbnail VARCHAR(255),
    
    CONSTRAINT fk_categories_parent
        FOREIGN KEY (parent_id) 
        REFERENCES categories(id) 
        ON DELETE SET NULL
);

CREATE INDEX idx_categories_parent_id
    ON categories(parent_id);

-- جلوگیری از نام تکراری در یک سطح
CREATE UNIQUE INDEX uq_categories_parent_name
    ON categories (
        COALESCE(
            parent_id,
            '00000000-0000-0000-0000-000000000000'
        ),
        name
    );

-- ============================================================
-- 7. PRODUCTS
-- ============================================================

CREATE TABLE products (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    sku VARCHAR(100) NOT NULL,

    name VARCHAR(200) NOT NULL,

    brand VARCHAR(100),

    weight_g DECIMAL(13,3) NOT NULL
        CHECK (weight_g > 0),

    image VARCHAR(255),

    description TEXT,

    stock INT NOT NULL DEFAULT 0
        CHECK (stock >= 0),

    CONSTRAINT uq_products_sku
        UNIQUE (sku)
);

-- ============================================================
-- 8. PRODUCT CATEGORIES
-- ============================================================

CREATE TABLE product_categories (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    product_id CHAR(36) NOT NULL,

    category_id CHAR(36) NOT NULL,

    CONSTRAINT uq_product_categories
        UNIQUE (product_id, category_id),
        
    CONSTRAINT fk_product_categories_product
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_product_categories_category
        FOREIGN KEY (category_id) 
        REFERENCES categories(id) 
        ON DELETE CASCADE
);

-- ============================================================
-- 9. NUTRITION PROFILES
-- ============================================================

CREATE TABLE nutrition_profiles (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    product_id CHAR(36) NOT NULL,

    calories DECIMAL(10,2) NOT NULL
        CHECK (calories >= 0),

    protein DECIMAL(10,2) NOT NULL
        CHECK (protein >= 0),

    fat DECIMAL(10,2) NOT NULL
        CHECK (fat >= 0),

    carbohydrate DECIMAL(10,2) NOT NULL
        CHECK (carbohydrate >= 0),

    fiber DECIMAL(10,2) NOT NULL
        CHECK (fiber >= 0),

    sugar DECIMAL(10,2) NOT NULL
        CHECK (sugar >= 0),

    sodium DECIMAL(10,2) NOT NULL
        CHECK (sodium >= 0),

    vitamins JSON,

    minerals JSON,

    CONSTRAINT uq_nutrition_profiles_product
        UNIQUE (product_id),
        
    CONSTRAINT fk_nutrition_profiles_product
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE
);

-- ============================================================
-- 10. PRICES
-- ============================================================

CREATE TABLE prices (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    product_id CHAR(36) NOT NULL,

    store_name VARCHAR(150) NOT NULL,

    price DECIMAL(18,2) NOT NULL
        CHECK (price >= 0),

    date DATE NOT NULL,

    currency CHAR(3) NOT NULL DEFAULT 'IRR',

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT ck_prices_currency
        CHECK (currency = 'IRR'),

    CONSTRAINT uq_prices_product_store_date
        UNIQUE (product_id, store_name, date),
        
    CONSTRAINT fk_prices_product
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE
);

-- ============================================================
-- 11. SHOPPING ITEMS
-- ============================================================

CREATE TABLE shopping_items (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    shopping_plan_id CHAR(36) NOT NULL,

    product_id CHAR(36) NOT NULL,

    quantity DECIMAL(10,3) NOT NULL
        CHECK (quantity > 0),

    unit_price DECIMAL(18,2) NOT NULL
        CHECK (unit_price >= 0),

    score DECIMAL(6,2),

    subtotal DECIMAL(18,2) NOT NULL
        CHECK (subtotal >= 0),

    CONSTRAINT uq_shopping_items_plan_product
        UNIQUE (shopping_plan_id, product_id),
        
    CONSTRAINT fk_shopping_items_plan
        FOREIGN KEY (shopping_plan_id) 
        REFERENCES shopping_plans(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_shopping_items_product
        FOREIGN KEY (product_id) 
        REFERENCES products(id)
);

-- ============================================================
-- 12. RECOMMENDATION HISTORY
-- ============================================================

CREATE TABLE recommendation_history (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    shopping_plan_id CHAR(36) NOT NULL,

    algorithm_version_id CHAR(36) NOT NULL,

    generated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    execution_time_ms INT NOT NULL
        CHECK (execution_time_ms >= 0),

    total_products_considered INT NOT NULL DEFAULT 0
        CHECK (total_products_considered >= 0),

    total_products_selected INT NOT NULL DEFAULT 0
        CHECK (total_products_selected >= 0),
        
    CONSTRAINT fk_recommendation_history_plan
        FOREIGN KEY (shopping_plan_id) 
        REFERENCES shopping_plans(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_recommendation_history_algorithm
        FOREIGN KEY (algorithm_version_id) 
        REFERENCES algorithm_versions(id)
);

-- ============================================================
-- 13. RECOMMENDATION REASONS
-- ============================================================

CREATE TABLE recommendation_reasons (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    recommendation_history_id CHAR(36) NOT NULL,

    product_id CHAR(36) NOT NULL,

    reason_type SMALLINT NOT NULL,

    reason_text TEXT NOT NULL,

    score DECIMAL(6,2),

    priority SMALLINT NOT NULL DEFAULT 1,
    
    CONSTRAINT fk_recommendation_reasons_history
        FOREIGN KEY (recommendation_history_id) 
        REFERENCES recommendation_history(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_recommendation_reasons_product
        FOREIGN KEY (product_id) 
        REFERENCES products(id)
);

-- ============================================================
-- 14. DECISION LOGS
-- ============================================================

CREATE TABLE decision_logs (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),

    recommendation_history_id CHAR(36) NOT NULL,

    product_id CHAR(36) NOT NULL,

    action SMALLINT NOT NULL,

    reason VARCHAR(255),

    details JSON,

    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
        
    CONSTRAINT fk_decision_logs_history
        FOREIGN KEY (recommendation_history_id) 
        REFERENCES recommendation_history(id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_decision_logs_product
        FOREIGN KEY (product_id) 
        REFERENCES products(id)
);

-- ============================================================
-- INDEXES
-- ============================================================

CREATE INDEX idx_family_members_family_id
    ON family_members(family_id);

CREATE INDEX idx_users_family_id
    ON users(family_id);

CREATE INDEX idx_shopping_plans_user_id
    ON shopping_plans(user_id);

CREATE INDEX idx_shopping_plans_algorithm_version_id
    ON shopping_plans(algorithm_version_id);

CREATE INDEX idx_product_categories_category_id
    ON product_categories(category_id);

CREATE INDEX idx_nutrition_profiles_product_id
    ON nutrition_profiles(product_id);

CREATE INDEX idx_prices_product_date
    ON prices(product_id, date DESC);

CREATE INDEX idx_prices_store_name
    ON prices(store_name);

CREATE INDEX idx_shopping_items_plan_id
    ON shopping_items(shopping_plan_id);

CREATE INDEX idx_shopping_items_product_id
    ON shopping_items(product_id);

CREATE INDEX idx_recommendation_history_shopping_plan_id
    ON recommendation_history(shopping_plan_id);

CREATE INDEX idx_recommendation_reasons_history_id
    ON recommendation_reasons(recommendation_history_id);

CREATE INDEX idx_recommendation_reasons_product_id
    ON recommendation_reasons(product_id);

CREATE INDEX idx_decision_logs_history_id
    ON decision_logs(recommendation_history_id);

CREATE INDEX idx_decision_logs_product_id
    ON decision_logs(product_id);
