CREATE DATABASE e_commerce_analysis;
USE e_commerce_analysis;


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);


CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (first_name, last_name, email, join_date) VALUES
('John', 'Doe', 'johndoe@gmail.com', '2023-01-10'),
('Jane', 'Smith', 'janesmith@gmail.com', '2023-02-15'),
('Alice', 'Johnson', 'alicejohnson@gmail.com', '2023-03-20'),
('Bob', 'Brown', 'bobbrown@gmail.com', '2023-04-25'),
('Carol', 'Williams', 'carolwilliams@gmail.com', '2023-05-30'),
('David', 'Wilson', 'davidwilson@gmail.com', '2023-06-10'),
('Emma', 'Moore', 'emmamoore@gmail.com', '2023-07-15'),
('Frank', 'Taylor', 'franktaylor@gmail.com', '2023-08-20'),
('Grace', 'Anderson', 'graceanderson@gmail.com', '2023-09-25'),
('Henry', 'Thomas', 'henrythomas@gmail.com', '2023-10-30'),
('Ivy', 'Jackson', 'ivyjackson@gmail.com', '2023-11-05'),
('Jack', 'White', 'jackwhite@gmail.com', '2023-12-10'),
('Kathy', 'Harris', 'kathyharris@gmail.com', '2024-01-15'),
('Liam', 'Martin', 'liammartin@gmail.com', '2024-02-20'),
('Mia', 'Thompson', 'miathompson@gmail.com', '2024-03-25'),
('Noah', 'Garcia', 'noahgarcia@gmail.com', '2024-04-30'),
('Olivia', 'Martinez', 'oliviamartinez@gmail.com', '2024-05-15'),
('Paul', 'Robinson', 'paulrobinson@gmail.com', '2024-06-20'),
('Quinn', 'Clark', 'quinnclark@gmail.com', '2024-07-25'),
('Rita', 'Rodriguez', 'ritarodriguez@gmail.com', '2024-08-30');

select * from customers;


INSERT INTO products (product_name, category, price) VALUES
('Smartphone', 'Electronics', 699.99),
('Laptop', 'Electronics', 1199.99),
('Headphones', 'Accessories', 149.99),
('Keyboard', 'Accessories', 79.99),
('Office Chair', 'Furniture', 249.99),
('Monitor', 'Electronics', 299.99),
('Mouse', 'Accessories', 49.99),
('Desk Lamp', 'Furniture', 89.99),
('Webcam', 'Electronics', 89.99),
('Smartwatch', 'Electronics', 199.99),
('Printer', 'Electronics', 129.99),
('Tablet', 'Electronics', 349.99),
('Bluetooth Speaker', 'Accessories', 79.99),
('External Hard Drive', 'Electronics', 139.99),
('USB Flash Drive', 'Accessories', 29.99),
('Gaming Mouse', 'Accessories', 89.99),
('Ergonomic Chair', 'Furniture', 399.99),
('Desk Organizer', 'Furniture', 39.99),
('Wireless Charger', 'Accessories', 59.99),
('Portable SSD', 'Electronics', 199.99);

select * from products;


INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-15', 799.98),
(2, '2024-02-20', 1299.98),
(3, '2024-03-22', 329.98),
(4, '2024-04-30', 79.99),
(5, '2024-05-31', 249.99),
(6, '2024-06-10', 299.98),
(7, '2024-07-15', 169.98),
(8, '2024-08-20', 359.98),
(9, '2024-09-25', 119.98),
(10, '2024-10-30', 149.99),
(11, '2024-11-05', 249.99),
(12, '2024-12-10', 449.98),
(13, '2024-01-15', 79.99),
(14, '2024-02-20', 349.99),
(15, '2024-03-25', 89.99),
(16, '2024-04-30', 119.98),
(17, '2024-05-15', 79.99),
(18, '2024-06-20', 299.99),
(19, '2024-07-25', 89.99),
(20, '2024-08-30', 149.99);


select * from orders;


INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 28, 699.99),
(1, 3, 23, 149.99),
(2, 2, 10, 1199.99),
(2, 4, 54, 79.99),
(3, 5, 12, 249.99),
(3, 7, 10, 79.99),
(4, 8, 7, 79.99),
(5, 6, 9, 299.99),
(6, 9, 22, 89.99),
(6, 10, 55, 199.99),
(7, 11, 34, 129.99),
(7, 12, 3, 349.99),
(8, 13, 67, 79.99),
(8, 14, 73, 139.99),
(9, 15, 109, 29.99),
(10, 16, 23, 89.99),
(11, 17, 64, 399.99),
(12, 18, 45, 299.99),
(13, 19, 87, 59.99),
(14, 20, 11, 199.99),
(15, 1, 33, 699.99),
(15, 4, 76, 79.99),
(16, 2, 98, 1199.99),
(16, 3, 23, 149.99),
(17, 5, 55, 249.99),
(18, 6, 34, 299.99),
(19, 7, 76, 79.99),
(20, 8, 88, 79.99);


select * from order_items;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_orders DESC;
    
    
SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(o.total_amount) AS total_sales
FROM
    orders o
GROUP BY
    YEAR(o.order_date), MONTH(o.order_date)
ORDER BY
    year, month;


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent,
    CASE
        WHEN SUM(o.total_amount) <= 500 THEN 'Low'
        WHEN SUM(o.total_amount) BETWEEN 501 AND 1000 THEN 'Medium'
        ELSE 'High'
    END AS spending_category
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_spent DESC;




SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_spent DESC
LIMIT 10;



SELECT
    CASE
        WHEN total_amount <= 100 THEN 'Low'
        WHEN total_amount BETWEEN 101 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS order_value_range,
    COUNT(order_id) AS order_count
FROM
    orders
GROUP BY
    order_value_range;

