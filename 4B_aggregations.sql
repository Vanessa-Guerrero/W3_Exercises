USE northwind;

-- 1. What is the price of the cheapest item that Northwind sells?
SELECT MIN(UnitPrice) AS 'Cheapest Item'
FROM products;

-- 2. What is the average price of items that Northwind sells?

SELECT AVG(UnitPrice) AS 'Average Price of Items'
FROM products;

-- 3. What is the price of the most expensive item that Northwind sells?

SELECT MAX(UnitPrice) AS 'Most Expensive Item'
FROM products;

-- 4. What is the sum of all the employee's salaries?

SELECT SUM(Salary) AS 'Total of Employee Salaries'
FROM employees;

-- 5. Which employee makes the highest salary, and which employee makes the lowest?

SELECT concat(FirstName, ' ', LastName) AS Employee, Salary
FROM employees
WHERE Salary = (SELECT MIN(Salary) FROM employees)
OR Salary = (SELECT MAX(Salary) FROM employees)
;

-- 6. What is the supplier ID of each supplier and the number of items they supply? (You can answer this query by only looking at the products table.) 

SELECT SupplierID, count(ProductID) AS 'Number of Items'
FROM products
GROUP BY SupplierID; 

-- 7. What is the category ID of each category and the average price of each item in the category? (You can answer this query by only looking at the products table.) 

SELECT CategoryID, AVG(UnitPrice) AS 'Average Item Price per Category'
FROM products
GROUP BY CategoryID; 

-- 8. For suppliers that provide at least 5 items to Northwind, what is the supplier ID of each supplier and the number of items they supply? (Again, you can answer this query by only looking at the products table.) 

SELECT SupplierID, count(ProductID) AS 'Number of Items'
FROM products
GROUP BY SupplierID
HAVING count(ProductID) >= 5; 

-- 9. List the product id, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value. If two or more have the same value, order by product name.

SELECT ProductID, ProductName, (UnitPrice * UnitsInStock) AS InventoryValue
FROM products
ORDER BY InventoryValue DESC, ProductName;
