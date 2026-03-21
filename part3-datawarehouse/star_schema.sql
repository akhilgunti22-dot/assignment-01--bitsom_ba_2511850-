-- Q3.1: Star Schema Design

-- =========================
-- DIMENSION TABLE: Date
-- =========================
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT
);

INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-01-03', 3, 1, 2024),
(4, '2024-01-04', 4, 1, 2024),
(5, '2024-01-05', 5, 1, 2024);

-- =========================
-- DIMENSION TABLE: Store
-- =========================
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);

INSERT INTO dim_store VALUES
(101, 'Store A', 'Mumbai', 'Maharashtra'),
(102, 'Store B', 'Delhi', 'Delhi'),
(103, 'Store C', 'Bangalore', 'Karnataka'),
(104, 'Store D', 'Chennai', 'Tamil Nadu'),
(105, 'Store E', 'Hyderabad', 'Telangana');

-- =========================
-- DIMENSION TABLE: Product
-- =========================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- NOTE: Category cleaned (consistent casing)
INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mobile', 'Electronics'),
(203, 'Shirt', 'Clothing'),
(204, 'Rice', 'Groceries'),
(205, 'TV', 'Electronics');

-- =========================
-- FACT TABLE: Sales
-- =========================
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED FACT DATA
-- =========================
-- Data cleaned:
-- - Dates standardized
-- - NULLs removed
-- - Categories standardized

INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 50000),
(2, 1, 102, 202, 2, 40000),
(3, 2, 103, 203, 3, 4500),
(4, 2, 104, 204, 5, 2500),
(5, 3, 105, 205, 1, 60000),
(6, 3, 101, 202, 1, 20000),
(7, 4, 102, 203, 2, 3000),
(8, 4, 103, 204, 4, 2000),
(9, 5, 104, 201, 1, 50000),
(10, 5, 105, 205, 2, 120000);
