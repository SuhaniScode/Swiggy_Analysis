-- checking null values
SELECT * FROM swiggy
WHERE Restaurant IS NULL OR City IS NULL OR Price IS NULL;

-- checking duplicate
SELECT ID, COUNT(*)
FROM swiggy
GROUP BY ID
HAVING COUNT(*) > 1;

-- checking invalid price (like- 0)
SELECT * FROM swiggy
WHERE Price <= 0;

-- removing wrong(like 0)
DELETE FROM swiggy
WHERE Price <= 0;

-- cities having the highest number of orders
SELECT City, COUNT(*) AS total_orders
FROM swiggy
GROUP BY City
ORDER BY total_orders DESC;

-- top 10 restaurants (on the basis of number of orders)
SELECT Restaurant, COUNT(*) AS total_orders
FROM swiggy
GROUP BY Restaurant
ORDER BY total_orders DESC
LIMIT 5;

-- checking average order value in each city
SELECT City, AVG(Price) AS avg_price
FROM swiggy
GROUP BY City
ORDER BY avg_price DESC;

-- high value orders (premium cust.)
SELECT Restaurant, City, Price
FROM swiggy
WHERE Price > 500
ORDER BY Price DESC;
