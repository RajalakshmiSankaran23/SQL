create database TechShop;
use TechShop;

create table Customers(
CustomerID int primary key,
Firstname varchar(50),
Lastname varchar(50),
Email varchar(100),
Phone varchar(20),
Address varchar(255)
);


create table Products(
ProductID int primary key,
ProductName varchar(255),
Description varchar(255),
price decimal(10,2)
);

create table Orders(
OrderID int primary key,
CustomerID int,
Orderdate Date,
foreign key (CustomerID) references Customers(CustomerID)
);



create table OrderDetails(
OrderDetailsID int primary key,
OrderID int,
ProductID int,
Quantity int,
foreign key (OrderID) references Orders(OrderID),
foreign key (ProductID) references Products(ProductID)
);

create table Inventory(
InventoryID int primary key,
ProductID int,
QuantityInStock int,
LastStockUpdate int,
foreign key (ProductID) references Products(ProductId)
);


--- Data Manipulation Language (DML):
--- Insert at least 10 sample records into each of the following tables.insert into [dbo].[Customers] values ( 1,'Ramya','Sankaran','ramya123@gmail.com',9987564231,'Chennai');insert into [dbo].[Customers] values ( 2,'Raj','Shetty','raj@gmail.com',9987565444,'Chennai');insert into [dbo].[Customers] values ( 3,'Rekha','Venkat','rekha@gmail.com',6382139475,'Chennai');insert into [dbo].[Customers] values ( 4,'Deepa','Senthil','deepa@gmail.com',9987123451,'Banglore');insert into [dbo].[Customers] values ( 5,'Suba','Vinay','suba@gmail.com',9933442255,'Mumbai');insert into [dbo].[Customers] values ( 6,'Abi','Aruna','abi@gmail.com',9876543210,'Delhi');insert into [dbo].[Customers] values ( 7,'Mounika','Madhan','mouni@gmail.com',9987565422,'Banglore');insert into [dbo].[Customers] values ( 8,'Thangam','Ganesh','thangam@gmail.com',9987564230,'Mumbai');insert into [dbo].[Customers] values ( 9,'Kayal','Ram','kayal@gmail.com',7708075181,'Chennai');insert into [dbo].[Customers] values ( 10,'Vinodh','Anandh','vinodh@gmail.com',9987546372,'Chennai');select * from [dbo].[Customers];insert into [dbo].[Products] values ( 111, 'Thermal Printer','High speed printing',1895.50);insert into [dbo].[Products] values ( 112, 'Organizer case ','Electronic gadget',500.00);insert into [dbo].[Products] values ( 113, 'Tool pen','Multifunction pen',150.50);insert into [dbo].[Products] values ( 114, 'Table fan','Portable',1500.50);insert into [dbo].[Products] values ( 115, 'LCD writing pad','12-inch pad',1687.50);insert into [dbo].[Products] values ( 116, 'Digital notebook','Business',2000.50);insert into [dbo].[Products] values ( 117, 'Mobile holder','Accessories',250.50);insert into [dbo].[Products] values ( 118, 'Power bank','Accessories',3000.50);insert into [dbo].[Products] values ( 119, 'Mouse','Multicolour LEDs',700.50);insert into [dbo].[Products] values ( 120, 'Pendrive','All sizes',1000.50);select * from [dbo].[Products];insert into[dbo].[Orders] values (21,1, '2023-06-20');
insert into[dbo].[Orders] values (22,2, '2023-06-21');
insert into[dbo].[Orders] values (23,3, '2023-06-22');
insert into[dbo].[Orders] values (24,4, '2023-06-21');
insert into[dbo].[Orders] values (25,5, '2023-06-23');
insert into[dbo].[Orders] values (26,6, '2023-06-22');
insert into[dbo].[Orders] values (27,7, '2023-06-26');
insert into[dbo].[Orders] values (28,8, '2023-06-27');
insert into[dbo].[Orders] values (29,9, '2023-06-29');
insert into[dbo].[Orders] values (30,10, '2023-06-29');

select * from [dbo].[Orders];

insert into [dbo].[OrderDetails] values (901,21,111,3);
insert into [dbo].[OrderDetails] values (902,22,112,9);
insert into [dbo].[OrderDetails] values (903,23,113,5);
insert into [dbo].[OrderDetails] values (904,24,114,8);
insert into [dbo].[OrderDetails] values (905,25,115,2);
insert into [dbo].[OrderDetails] values (906,26,116,3);
insert into [dbo].[OrderDetails] values (907,27,117,1);
insert into [dbo].[OrderDetails] values (908,28,118,2);
insert into [dbo].[OrderDetails] values (909,29,119,4);
insert into [dbo].[OrderDetails] values (1000,30,120,5);
    
select * from [dbo].[OrderDetails];
insert into [dbo].[Inventory] values(1001,111,20,17);insert into [dbo].[Inventory] values(1002,112,24,15);insert into [dbo].[Inventory] values(1003,113,30,25);insert into [dbo].[Inventory] values(1004,114,80,72);insert into [dbo].[Inventory] values(1005,115,70,68);insert into [dbo].[Inventory] values(1006,116,50,47);insert into [dbo].[Inventory] values(1007,117,40,39);insert into [dbo].[Inventory] values(1008,118,30,28);insert into [dbo].[Inventory] values(1009,119,40,36);insert into [dbo].[Inventory] values(1010,120,60,55);select * from [dbo].[Inventory];--- 3.b.1  SQL query to retrieve the names and emails of all customersselect [Firstname], [Email] from [dbo].[Customers];--- 3.b.2  SQL query to list all orders with their order dates and corresponding customer select c.[Firstname] , o.[CustomerID], od.[OrderID]from Customers c, Orders o, OrderDetails odwhere c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID;---3.b.3 SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.insert into Customers Values(11,'Kanniga','Sankaran','kanniga@gmail.com',8876452223,'Chennai');select * from Customers;---3.b.4 dSQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.update Products 
SET price = price*1.1;

select [price] from [dbo].[Products];

---3.b.5 SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter
delete from [dbo].[OrderDetails] where [OrderID] = 22;delete from [dbo].[Orders] where [OrderID] = 22;---3.b.6 SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary informatiooninsert into [dbo].[Orders] values (31,11,'2023-05-21');alter table [dbo].[Orders]add   TotalAmount int ; ---3.b.7 SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact informationupdate [dbo].[Customers]set [Email] = 'raj23@gmail.com', [Address] = 'Banglore'where [CustomerID] = 2;select * from [dbo].[Customers];---- 4 1 SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.SELECT 
    Orders.OrderID,
    Orders.Orderdate,
    Orders.TotalAmount,
    Customers.Firstname,
    Customers.Lastname,
    Customers.Email,
    Customers.Phone,
    Customers.Address
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID;--- 4 2  SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.SELECT
    P.ProductID,
    P.ProductName,
    SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
	GROUP BY
    P.ProductID, P.ProductName;---4 3 SQL query to list all customers who have made at least one purchase. Include their names and contact information.SELECT DISTINCT
    C.CustomerID,
    C.Firstname,
    C.Lastname,
    C.Email,
    C.Phone,
    C.Address
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID;---4 4 SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.

SELECT
    P.ProductName,
    SUM(OD.Quantity) AS TotalQuantityOrdered
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY
    P.ProductName
ORDER BY
    TotalQuantityOrdered DESC;

ALTER TABLE Products
ADD Category VARCHAR(50);

Select *from Products;



--- 4 5 SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

SELECT
    ProductID,
    ProductName,
    Description,
    Price,
    Category
FROM
    Products
WHERE
    Category = 'Electronic Gadget';




--- 4 6 SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    AVG(O.TotalAmount) AS AverageOrderValue
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;




---4 7 SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.

SELECT
    O.OrderID,
    O.OrderDate,
    O.TotalAmount AS TotalRevenue,
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Address
FROM
    Orders AS O
JOIN
    Customers AS C ON O.CustomerID = C.CustomerID
ORDER BY
    TotalRevenue DESC



---4 8 SQL query to list electronic gadgets and the number of times each product has been ordered.SELECT
    P.ProductID,
    P.ProductName,
    COUNT(OD.OrderID) AS OrderCount
FROM
    Products AS P
LEFT JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
WHERE
    P.Category = 'Electronic Gadget'
GROUP BY
    P.ProductID, P.ProductName;

	

-- 5 1 SQL query to find out which customers have not placed any orders
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Address
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
WHERE
    O.OrderID IS NULL;



---5 2 SQL query to find the total number of products available for sale

select sum([LastStockUpdate])
from [dbo].[Inventory];



---5 3   SQL query to calculate the total revenue generated by TechShop.

SELECT 
    s.ProductID,
    p.ProductName,
    SUM(s.Quantity * p.price) AS total_revenue
FROM 
    OrderDetails s
JOIN 
    products p ON s.ProductID = p.ProductID
GROUP BY 
    s.ProductID, p.ProductName;


-- Calculate overall total revenue
SELECT 
    SUM(total_revenue_per_product) AS overall_total_revenue
FROM (
    SELECT 
        s.ProductID,
        p.ProductName,
        SUM(s.Quantity * p.price) AS total_revenue_per_product
    FROM 
        OrderDetails s
    JOIN 
        products p ON s.ProductID = p.ProductID
    GROUP BY 
        s.ProductID, p.ProductName
) AS subquery;


--- 5 4 SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter
SELECT
    AVG(subquery.quantity) AS averageQuantityOrdered
FROM
    (
        SELECT
            OrderDetails.quantity
        FROM
            OrderDetails
        JOIN
            Products ON OrderDetails.productID = Products.productID
        JOIN
            Category ON Products.categoryID = Category.categoryID
        WHERE
            Category.categoryName = :category_name
    ) AS subquery;

---5 5 SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a paramet


SELECT
    SUM(subquery.revenue) AS totalRevenue
FROM
    (
        SELECT
            OrderDetails.quantity * Products.price AS revenue
        FROM
            OrderDetails
        JOIN
            Orders ON OrderDetails.orderID = Orders.orderID
        WHERE
            Orders.customerID = customerID
    ) AS subquery;


---5 6  SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed

SELECT
    customerID,
    firstName,
    lastName,
    numberOfOrders
FROM (
    SELECT
        Customers.customerID,
        Customers.firstName,
        Customers.lastName,
        COUNT(Orders.orderID) AS numberOfOrders,
        RANK() OVER (ORDER BY COUNT(Orders.orderID) DESC) AS rnk
    FROM
        Customers
    LEFT JOIN
        Orders ON Customers.customerID = Orders.customerID
    GROUP BY
        Customers.customerID, Customers.firstName, Customers.lastName
) AS ranked
WHERE
    rnk = 1;

---5 7 Write an SQL query to find the most popular product category, which is the one with the highest 
total quantity ordered across all orders

SELECT
    P.Category,
    SUM(OD.Quantity) AS TotalQuantityOrdered
FROM
    Products AS P
JOIN
    OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY
    P.Category
ORDER BY
    TotalQuantityOrdered DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--- 5 8
	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    SUM(OD.Quantity * P.Price) AS TotalSpending
FROM
    Customers AS C
JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
JOIN
    OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN
    Products AS P ON OD.ProductID = P.ProductID
WHERE
    P.Category = 'Electronic Gadget'
GROUP BY
    C.CustomerID, C.FirstName, C.LastName
ORDER BY
    TotalSpending DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--- 5 9
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS NumberOfOrders,
    SUM(O.TotalAmount) AS TotalRevenue,
    AVG(O.TotalAmount) AS AverageOrderValue
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;


--- 5 10
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS OrderCount
FROM
    Customers AS C
LEFT JOIN
    Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.FirstName, C.LastName;






        


