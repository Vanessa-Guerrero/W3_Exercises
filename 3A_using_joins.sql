USE northwind;

-- 1. List the product id, product name, unit price and category name of all products. Order by category name and within that, by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName
FROM products
JOIN categories USING (CategoryID)
ORDER BY CategoryName, ProductName; 

-- 2. List the product id, product name, unit price and supplier name of all products that cost more than $75. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CompanyName
FROM products
JOIN suppliers USING (SupplierID)
WHERE UnitPrice > 75
ORDER BY ProductName;

-- 3. List the product id, product name, unit price, category name, and supplier name of every product. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName
FROM products
JOIN suppliers USING (SupplierID)
JOIN categories USING (CategoryID)
ORDER BY ProductName;

-- 4. List the order id, ship name, ship address, and shipping company name of every order that shipped to Germany.

SELECT OrderID, ShipName, ShipAddress, CompanyName
FROM orders as O
JOIN shippers as S
ON O.ShipVia = S.ShipperID
WHERE O.ShipCountry = 'Germany';

-- 5. List the order id, order date, ship name, ship address of all orders that ordered "Sasquatch Ale" 

SELECT OrderID, OrderDate, ShipName, ShipAddress
FROM orders
JOIN `order details` USING (OrderID)
WHERE ProductID = 34;
