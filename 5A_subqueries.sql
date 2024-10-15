USE northwind;

/* 1. What is the product name(s) of the most expensive products? HINT: Find the max price 
in a subquery and then use that value to find products whose price equals that value. */

SELECT ProductName, UnitPrice
FROM products 
WHERE UnitPrice = (SELECT max(UnitPrice) FROM products); 

/* 2. What is the product name(s) and categories of the most expensive products? HINT: 
Find the max price in a subquery and then use that in your more complex query that 
joins products with categories. */

SELECT ProductName, UnitPrice, CategoryName
FROM products 
JOIN categories USING (CategoryID)
WHERE UnitPrice = (SELECT max(UnitPrice) FROM products); 

/* 3. What is the order id, shipping name and shipping address of all orders shipped via 
"Federal Shipping"? HINT: Find the shipper id of "Federal Shipping" in a subquery and 
then use that value to find the orders that used that shipper. */

SELECT OrderID, ShipName, ShipAddress
FROM orders
WHERE ShipVia = (SELECT ShipperID FROM Shippers
				WHERE CompanyName = 'Federal Shipping')
;

/* 4. What are the order ids of the orders that ordered "Sasquatch Ale"? HINT: Find the 
product id of "Sasquatch Ale" in a subquery and then use that value to find the 
matching orders from the 'order details' table. Because the 'order details' table has a 
space in its name, you will need to surround it with back ticks in the FROM clause. */

SELECT OrderID
FROM `order details`
WHERE ProductID = (SELECT ProductID FROM products 
				   WHERE ProductName = 'Sasquatch Ale')
;

-- 5. What is the name of the employee that sold order 10266?

SELECT concat(FirstName, ' ', LastName) AS Employee
FROM employees
WHERE EmployeeID = (SELECT EmployeeID FROM orders 
					WHERE OrderID = 10266)
;

-- 6. What is the name of the customer that bought order 10266?

SELECT CompanyName
FROM customers
WHERE CustomerID = (SELECT CustomerID FROM orders
					WHERE OrderID = 10266)
;
