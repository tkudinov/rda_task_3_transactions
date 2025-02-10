-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
ALTER TABLE Orders
ADD Count INT;

INSERT INTO Products (ID, Name, WarehouseAmount)
VALUES ("1", "AwersomeProduct", "1");

INSERT INTO Customers (ID, FirstName, LastName, Email, Address)
VALUES ("1", "Paul", "Cole", "pk@net.com", "Rome");

INSERT INTO Orders (ID, CustomerID, Date )
VALUES ("1", "1", "2025-02-10");

INSERT INTO OrderItems (ID, OrderID, ProductID)
VALUES ("1", "1", "1");
-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
UPDATE Orders SET Count = 1;
UPDATE Orders SET Count = Count - 1 WHERE ID = '1';
COMMIT; 