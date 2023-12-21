create database ECOM;
use ECOM;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    description TEXT,
    stockQuantity INT
);

CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



INSERT INTO customers (customer_id, name, email, Address)
VALUES(1, 'John Doe', 'johndoe@example.com', '123 Main St, City'),
(2, 'Jane Smith', 'janesmith@example.com', '456 Elm St, Town'),
(3, 'Robert Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5, 'David Lee', 'david@example.com', '234 Cedar St, District'),
(6, 'Laura Hall', 'laura@example.com', '567 Birch St, County'),
(7, 'Michael Davis', 'michael@example.com', '890 Maple St, State'),
(8, 'Emma Wilson', 'emma@example.com', '321 Redwood St, Country'),
(9, 'William Taylor', 'william@example.com', '432 Spruce St, Province'),
(10, 'Olivia Adams', 'olivia@example.com', '765 Fir St, Territory');

select * from customers;



INSERT INTO products (product_id, name, price, description, stockQuantity)
VALUES(1, 'Laptop', 800.00, 'High-performance laptop', 10),
(2, 'Smartphone', 600.00, 'Latest smartphone', 15),
(3, 'Tablet', 300.00, 'Portable tablet', 20),
(4, 'Headphones', 150.00, 'Noise-canceling', 30),
(5, 'TV', 900.00, '4K Smart TV', 5),
(6, 'Coffee Maker', 50.00, 'Automatic coffee maker', 25),
(7, 'Refrigerator', 700.00, 'Energy-efficient', 10),
(8, 'Microwave Oven', 80.00, 'Countertop microwave', 15),
(9, 'Blender', 70.00, 'High-speed blender', 20),
(10, 'Vacuum Cleaner', 120.00, 'Bagless vacuum cleaner', 10);

select * from products;

INSERT INTO cart 
VALUES(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

select * from cart;


INSERT INTO orders (order_id, customer_id, order_date, total_price)
VALUES (1, 1, '2023-01-05', 1200.00),
(2, 2, '2023-02-10', 900.00),
(3, 3, '2023-03-15', 300.00),
(4, 4, '2023-04-20', 150.00),
(5, 5, '2023-05-25', 1800.00),
(6, 6, '2023-06-30', 400.00),
(7, 7, '2023-07-05', 700.00),
(8, 8, '2023-08-10', 160.00),
(9, 9, '2023-09-15', 140.00),
(10, 10, '2023-10-20', 1400.00);

select * from orders;

alter table order_items
add item_amount decimal (10,2);

-- Inserting values into the order_items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, item_amount)
VALUES(1, 1, 1, 2, 1600.00),
(2, 2, 3, 1, 300.00),
(3, 3, 2, 3, 1800.00),
(4, 4, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);

select * from order_items;

--- 1
UPDATE products
SET price = 800.00
WHERE product_id = 7;

---2
DELETE FROM cart
WHERE customer_id = 5;

---3
SELECT *FROM products
WHERE price <= 100.00;

---4
SELECT *FROM products
WHERE stockQuantity > 5;

---5
SELECT *FROM orders
WHERE total_price BETWEEN 500.00 AND 1000.00;

---6
SELECT *FROM products
WHERE name LIKE '%r';

---7
SELECT *FROM cart
WHERE customer_id = 5;

---8
SELECT DISTINCT c.*FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2023;

---9
SELECT product_id, name, MIN(stockQuantity) AS min_stock
FROM products
GROUP BY product_id, name;

---10
select customer_id, total_price from orders;

---11

SELECT
    c.customer_id,
    c.name AS customer_name,
    AVG(o.total_price) AS average_order_amount
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.name;

---12

select customer_id, quantity from cart;


---13

SELECT
    c.customer_id,
    c.name AS customer_name,
    MAX(o.total_price) AS max_order_amount
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.name;

---14

SELECT
    c.customer_id,
    c.name AS customer_name
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.name
HAVING
    SUM(o.total_price) > 1000;

---15

-- Subquery to find products not in the cart
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM cart
);

---16

SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM orders
);

---17

SELECT products.product_id, products.name,
SUM(order_items.item_amount) AS total_revenue,
ROUND((SUM(order_items.item_amount) / (SELECT SUM(orders.total_price) FROM orders)) * 100, 2) AS revenue_percentage
FROM products
JOIN order_items ON products.product_id = order_items.product_id
JOIN orders ON order_items.order_id = orders.order_id
GROUP BY products.product_id, products.name;


---18

SELECT *FROM products
WHERE stockQuantity <= 5;

---19
SELECT *FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_price > 1000);

---20

SELECT
    c.customer_id,
    c.name AS customer_name
FROM
    customers c
WHERE
    c.customer_id IN (
        SELECT DISTINCT
            o.customer_id
        FROM
            orders o
        JOIN
            order_items oi ON o.order_id = oi.order_id
        WHERE
            oi.item_amount > 500 
    );




