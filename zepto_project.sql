drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightsInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

SELECT COUNT(*) FROM zepto;

--sample dataset

SELECT * FROM zepto
LIMIT 10;

--null values

SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
weightsinGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product category

SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock

SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfstock;

--product names present multiple times

SELECT name, COUNT(sku_id) AS "Number Of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC; 

--DATA CLEANING--

--product with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM zepto; 


--BUSINESS INSIGHTS--

--Q1. Find the Top 10 best value products based on the discount percentage.

SELECT name, mrp, discountPercent 
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2. What are the products with high MRP but currently out of stock

SELECT  DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3. Calculate estimates revenue for each category

SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q4. Find all the products Where MRP is greater then rupees 500 and dicount is less than 10%

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC , discountpercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountPercent), 2) AS avg_offering
FROM zepto
GROUP BY category
ORDER BY avg_offering DESC
LIMIT 5;

--Q6. Find the price per gram for products above 100g and sort by the best values

SELECT DISTINCT name, weightsInGms, discountedSellingPrice, 
ROUND(discountedSellingPrice/weightsInGms, 2) AS price_per_gram
FROM zepto
WHERE weightsInGms >= 100
ORDER BY price_per_gram;

--Q7. Group the products into category like low, medium and bulk. 

SELECT DISTINCT name, weightsInGms,
CASE WHEN weightsInGms < 500 THEN 'Low'
     WHEN weightsInGms < 1000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--Q8. What is the total inventory weight per category

SELECT category,
ROUND(SUM(availableQuantity * weightsInGms),2) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;







