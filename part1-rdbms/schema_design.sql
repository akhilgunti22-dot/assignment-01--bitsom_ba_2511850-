-- Q1: Schema Design (3NF)

-- =========================
-- TABLE: Customers
-- =========================
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C001', 'Alice', 'alice@email.com', 'Mumbai'),
('C002', 'Bob', 'bob@email.com', 'Delhi'),
('C003', 'Charlie', 'charlie@email.com', 'Mumbai'),
('C004', 'David', 'david@email.com', 'Bangalore'),
('C005', 'Emma', 'emma@email.com', 'Mumbai');
-- =========================
-- TABLE: Products
-- =========================
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 50000),
('P002', 'Phone', 'Electronics', 20000),
('P003', 'Tablet', 'Electronics', 15000),
('P004', 'Chair', 'Furniture', 3000),
('P005', 'Desk', 'Furniture', 7000);

-- =========================
-- TABLE: Sales_Reps
-- =========================
CREATE TABLE Sales_Reps (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

INSERT INTO Sales_Reps VALUES
('R001', 'John'),
('R002', 'Mary'),
('R003', 'Steve'),
('R004', 'Anna'),
('R005', 'Paul');

-- =========================
-- TABLE: Orders
-- =========================
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES Sales_Reps(rep_id)
);

INSERT INTO Orders VALUES
('O001', 'C001', 'R001', '2024-01-01'),
('O002', 'C002', 'R002', '2024-01-02'),
('O003', 'C003', 'R003', '2024-01-03'),
('O004', 'C004', 'R004', '2024-01-04'),
('O005', 'C005', 'R005', '2024-01-05');

-- =========================
-- TABLE: Order_Items
-- =========================
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1, 'O001', 'P001', 1),
(2, 'O002', 'P002', 2),
(3, 'O003', 'P003', 1),
(4, 'O004', 'P004', 4),
(5, 'O005', 'P005', 2);
