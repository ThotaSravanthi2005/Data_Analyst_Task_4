
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 800),
('Smartphone', 'Electronics', 500),
('Shoes', 'Fashion', 50),
('Watch', 'Fashion', 120),
('Book', 'Education', 20);

INSERT INTO orders (customer_id, product_id, quantity, total_amount, order_date) VALUES
(1, 1, 1, 800, '2025-08-01'),
(1, 3, 2, 100, '2025-08-02'),
(2, 2, 1, 500, '2025-08-03'),
(3, 4, 1, 120, '2025-08-04'),
(2, 5, 3, 60, '2025-08-05');

SELECT product_name, price
FROM products
WHERE price > 50
ORDER BY price DESC;


SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;


SELECT c.name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


SELECT c.name, p.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN products p ON o.product_id = p.product_id;


SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);


CREATE VIEW high_value_orders AS
SELECT * FROM orders
WHERE total_amount > 100;


CREATE INDEX idx_customer_id ON orders(customer_id);








