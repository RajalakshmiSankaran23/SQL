create database CarRentalSystem;
use CarRentalSystem;

CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    year INT,
    dailyRate DECIMAL(10, 2),
    status VARCHAR(20) CHECK (status IN ('available', 'notAvailable')),
    passengerCapacity INT,
    engineCapacity INT
);

CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    phoneNumber VARCHAR(15)
);

CREATE TABLE Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT,
    customerID INT,
    startDate DATE,
    endDate DATE,
    type VARCHAR(20) CHECK (type IN ('DailyLease', 'MonthlyLease')),
    FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
);

insert into Vehicle values (1,' Toyota' ,'Camry' ,2022, 50.00,'available', 4, 2500);
insert into Vehicle values (2, 'Honda', 'Civic' ,2023, 45.00,'available', 7, 1500);
insert into Vehicle values(3 , 'Ford', 'Focus', 2022, 48.00, 'notAvailable', 4, 1400);
insert into Vehicle values(4, 'Nissan' ,'Altima' ,2023, 52.00, 'available', 7, 1200);
insert into Vehicle values(5, 'Chevrolet', 'Malibu', 2022, 47.00, 'available', 4, 1800);
insert into Vehicle values(6, 'Hyundai' ,'Sonata ',2023, 49.00, 'notAvailable', 7, 1400);
insert into Vehicle values(7, 'BMW','3 Series' ,2023, 60.00, 'available', 7, 2499);
insert into Vehicle values(8, 'Mercedes' ,'C-Class',2022, 58.00, 'available', 8, 2599);
insert into Vehicle values(9, 'Audi' ,'A4 ',2022 ,55.00, 'notAvailable', 4, 2500);
insert into Vehicle values(10, 'Lexus' ,'ES', 2023, 54.00, 'available', 4 ,2500);

select * from Vehicle;

insert into Customer values (1 , 'John',' Doe', 'johndoe@example.com', 555-555-5555);
insert into Customer values (2, 'Jane',' Smith' ,'janesmith@example.com ',555-123-4567);
insert into Customer values (3 ,'Robert', 'Johnson', 'robert@example.com', 555-789-1234);
insert into Customer values (4 ,'Sarah', 'Brown', 'sarah@example.com ',555-456-7890);
insert into Customer values (5 ,'David', 'Lee', 'david@example.com ',555-987-6543);
insert into Customer values (6 ,'Laura ','Hall ','laura@example.com', 555-234-5678);
insert into Customer values (7 ,'Michael',' Davis',' michael@example.com ',555-876-5432);
insert into Customer values (8 ,'Emma', 'Wilson ','emma@example.com ',555-432-1098);
insert into Customer values (9 ,'William',' Taylor',' william@example.com', 555-321-6547);
insert into Customer values (10,' Olivia', 'Adams', 'olivia@example.com ',555-765-4321);select * from Customer;INSERT INTO Lease VALUES(1, 1, 1, '2023-01-01', '2023-01-05', 'Daily');
INSERT INTO Lease VALUES(2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly');
INSERT INTO Lease VALUES(3, 3, 3, '2023-03-10', '2023-03-15', 'Daily');
INSERT INTO Lease VALUES(4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly');
INSERT INTO Lease VALUES(5, 5, 5, '2023-05-05', '2023-05-10', 'Daily');
INSERT INTO Lease VALUES(6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly');
INSERT INTO Lease VALUES(7, 7, 7, '2023-07-01', '2023-07-10', 'Daily');
INSERT INTO Lease VALUES(8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly');
INSERT INTO Lease VALUES(9, 3, 3, '2023-09-07', '2023-09-10', 'Daily');
INSERT INTO Lease VALUES(10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');

select * from Lease;

INSERT INTO Payment VALUES(1, 1, '2023-01-03', 200.00);
INSERT INTO Payment VALUES(2, 2, '2023-02-20', 1000.00);
INSERT INTO Payment VALUES(3, 3, '2023-03-12', 75.00);
INSERT INTO Payment VALUES(4, 4, '2023-04-25', 900.00);
INSERT INTO Payment VALUES(5, 5, '2023-05-07', 60.00);
INSERT INTO Payment VALUES(6, 6, '2023-06-18', 1200.00);
INSERT INTO Payment VALUES(7, 7, '2023-07-03', 40.00);
INSERT INTO Payment VALUES(8, 8, '2023-08-14', 1100.00);
INSERT INTO Payment VALUES(9, 9, '2023-09-09', 80.00);
INSERT INTO Payment VALUES(10, 10, '2023-10-25', 1500.00);


---1. Update the daily rate for a Mercedes car to 68.

UPDATE Vehicle
SET dailyRate = 68.00
WHERE make = 'Mercedes';

select * from Vehicle;

---2. Delete a specific customer and all associated leases and payments.

DELETE FROM Payment
WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID = (SELECT customerID FROM Customer WHERE firstName = 'John' AND lastName = 'Doe'));

DELETE FROM Lease
WHERE customerID = (SELECT customerID FROM Customer WHERE firstName = 'John' AND lastName = 'Doe');

DELETE FROM Customer
WHERE firstName = 'John' AND lastName = 'Doe';

--- 3. Rename the "paymentDate" column in the Payment table to "transactionDate"

table to "transactionDate".
ALTER TABLE Payment
RENAME COLUMN paymentDate TO transactionDate;

---4. Find a specific customer by email.

SELECT * FROM Customer WHERE email = 'johndoe@example.com';

---5. Get active leases for a specific customer.
SELECT 
    Lease.leaseID,
    Lease.startDate,
    Lease.endDate,
    Lease.type
FROM 
    Lease
JOIN 
    Customer ON Lease.customerID = Customer.customerID
WHERE 
    Customer.email = 'johndoe@example.com'
    AND CURDATE() BETWEEN Lease.startDate AND Lease.endDate;


---6. Find all payments made by a customer with a specific phone number

SELECT *FROM Payment
WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID = (SELECT customerID FROM Customer WHERE phoneNumber = '555-765-4321'));
---7. Calculate the average daily rate of all available carsSELECT AVG(dailyRate) AS averageDailyRate
FROM Vehicle
WHERE status = 'available';

---8. Find the car with the highest daily rate

SELECT *
FROM Vehicle
WHERE dailyRate = (SELECT MAX(dailyRate) FROM Vehicle);

---9. Retrieve all cars leased by a specific customer.

SELECT Vehicle.*
FROM Vehicle
JOIN Lease ON Vehicle.vehicleID = Lease.vehicleID
WHERE Lease.customerID = (
    SELECT customerID
    FROM Customer
    WHERE email = 'johndoe@example.com'
);

---10. Find the details of the most recent lease

SELECT Vehicle.*, Lease.*
FROM Vehicle
JOIN Lease ON Vehicle.vehicleID = Lease.vehicleID
WHERE Lease.startDate = (
    SELECT MAX(startDate)
    FROM Lease
);

---11. List all payments made in the year 2023.

SELECT *
FROM Payment
WHERE YEAR(paymentDate) = 2023;

---12. Retrieve customers who have not made any payments.
SELECT Customer.*
FROM Customer
LEFT JOIN Payment ON Customer.customerID = Payment.paymentID
WHERE Payment.paymentID IS NULL;

---13. 3. Retrieve Car Details and Their Total Payments

SELECT
    Vehicle.*,
    COALESCE(totalPayments, 0) AS totalPayments
FROM
    Vehicle
LEFT JOIN (
    SELECT
        Lease.vehicleID,
        SUM(Payment.amount) AS totalPayments
    FROM
        Lease
    LEFT JOIN
        Payment ON Lease.leaseID = Payment.leaseID
    GROUP BY
        Lease.vehicleID
) AS PaymentSummary ON Vehicle.vehicleID = PaymentSummary.vehicleID;

---14. Calculate Total Payments for Each Customer
SELECT
    Customer.*,
    COALESCE(
        (SELECT SUM(Payment.amount)
         FROM Lease
         LEFT JOIN Payment ON Lease.leaseID = Payment.leaseID
         WHERE Lease.customerID = Customer.customerID),
        0
    ) AS totalPayments
FROM
    Customer;

---15. List Car Details for Each Lease.

SELECT
    Lease.leaseID,
    Lease.startDate,
    Lease.endDate,
    Vehicle.vehicleID,
    Vehicle.make,
    Vehicle.model
FROM
    Lease
JOIN
    Vehicle ON Lease.vehicleID = Vehicle.vehicleID;


---16. Retrieve Details of Active Leases with Customer and Car Information

SELECT
    Lease.leaseID,
    Lease.startDate,
    Lease.endDate,
    Customer.customerID,
    Customer.firstName,
    Customer.lastName,
    Vehicle.vehicleID,
    Vehicle.make,
    Vehicle.model
FROM
    Lease
JOIN
    Customer ON Lease.customerID = Customer.customerID
JOIN
    Vehicle ON Lease.vehicleID = Vehicle.vehicleID
WHERE
    '2023-11-28' BETWEEN Lease.startDate AND Lease.endDate;

---17. Find the Customer Who Has Spent the Most on Leases.SELECT
    customerID,
    firstName,
    lastName,
    totalSpentOnLeases
FROM (
    SELECT
        Customer.customerID,
        Customer.firstName,
        Customer.lastName,
        COALESCE(SUM(Payment.amount), 0) AS totalSpentOnLeases,
        RANK() OVER (ORDER BY COALESCE(SUM(Payment.amount), 0) DESC) AS rnk
    FROM
        Customer
    LEFT JOIN
        Lease ON Customer.customerID = Lease.customerID
    LEFT JOIN
        Payment ON Lease.leaseID = Payment.leaseID
    GROUP BY
        Customer.customerID, Customer.firstName, Customer.lastName
) ranked
WHERE
    rnk = 1;

--- 18. List All Cars with Their Current Lease Information

	SELECT Vehicle.*, Lease.startDate, Lease.endDate, Customer.firstName, Customer.lastName
FROM Vehicle
LEFT JOIN Lease ON Vehicle.vehicleID = Lease.vehicleID
LEFT JOIN Customer ON Lease.customerID = Customer.customerID











