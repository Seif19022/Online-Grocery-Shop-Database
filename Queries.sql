/* Assignment queries answered*/

/*Write one SQL statement for the following queries*/

/* Q1) List the Category name and the corresponding product name */
SELECT Category.Category_Name AS CategoryName, Product.Name AS ProductName
FROM Product
INNER JOIN Category ON Product.Category_ID = Category.Category_ID;

/* Q2) Find the user that made the most order */
SELECT User.Name, COUNT(*) AS OrderCount
FROM `Order1`
INNER JOIN User ON `Order1`.User_ID = User.User_ID
GROUP BY `Order1`.User_ID
ORDER BY OrderCount DESC
LIMIT 1;

/* Q3) Show the count of product produced by each manufacturer */
SELECT Manufacture.Manufacture_Name, COUNT(*) AS ProductCount
FROM Product
INNER JOIN Manufacture ON Product.Manufacture_ID = Manufacture.Manufacture_ID
GROUP BY Product.Manufacture_ID;

/* Q4) Show the number of user */
SELECT COUNT(*) AS UserCount
FROM User;

/* Q5) Find average price of the product */
SELECT AVG(Price) AS AveragePrice
FROM Product;
