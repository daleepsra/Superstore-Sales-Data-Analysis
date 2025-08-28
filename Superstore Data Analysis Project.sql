CREATE DATABASE superstore_db;
USE superstore_db;
ALTER TABLE project CHANGE `Product Name` ProductName VARCHAR(255);
-- Product Category-wise Total Sales 
select Category,SUM(Sales) as TotalSales
 from project 
 group by Category
 order by SUM(Sales) ;
 
 -- Product Category-wise Total Profit
select Category,SUM(Profit) as TotalProfit
 from project
 group by Category
 order by SUM(Profit) ;
 -- Technology products have the highest profits, whereas Furniture products have very small total profit despite having pretty high Sales
 -- Top 5 most profitable Products
 select ProductName,SUM(Profit) as Profit
 from project
 group by ProductName
 order by SUM(Profit) DESC
 LIMIT 5;
 
 -- Top 5 most profitable cities
SELECT City,SUM(Profit) as Profit 
from project
 group by City
 Order by Profit
 DESC LIMIT 5;
-- New York City has total profit >2 times the total profit of any other city

 -- Top 5 loss making cities
SELECT City,SUM(Profit) as Profit
 from project
 group by City
 Order by Profit
 LIMIT 5;
-- Philadelphia,Houston,San Antonio,Lancaster,Chicago are leading to significant losses and might need marketing and advertising initiatives
 
 -- Top 5 most profitable states
SELECT STATE,SUM(Profit) as Profit
 from project
 group by STATE
 Order by Profit DESC
 LIMIT 5;
 -- California and New York make more than 2 times the profit of any other state
 
 -- Top 5 loss making states
 SELECT STATE,SUM(Profit) as Profit
 from project
 group by STATE
 Order by Profit
 LIMIT 5;
 -- Texas,Ohio,Pennsylvania,Illinois,North Carolina are leading to significant losses and might need marketing and advertising initiatives
 
 -- Most Selling Product Categories
 Select Category,SUM(Quantity) AS quantity
 from project
 group by Category
 order by quantity DESC;
 -- Office Supplies sold more than 20000 products(1.5 times that of furniture and technology products combined, so frequent restocking of office products is necessary)
 
 -- Top 10 Most Selling Product Sub Categories
Select `Sub-Category`,SUM(Quantity) AS quantity
 from project
 group by `Sub-Category`
 order by quantity DESC
 LIMIT 10;
 
 -- Profit Margin by Region
SELECT Region, SUM(Profit)/SUM(Sales)*100 AS ProfitMarginPct
 FROM PROJECT
 GROUP BY Region;    
 -- Central regions has significantly lower profit margin(8%) compared to the overall margin(12.5%) and needs to be an area of focus
 
 -- Total Order delivered within 3 days of ordering
SELECT COUNT(*) as Orders
FROM project
WHERE DATEDIFF(ship_date_parsed, order_date_parsed) <= 3;
-- Around 60% of the total orders were delivered within 3 days of ordering suggesting operational efficiency 