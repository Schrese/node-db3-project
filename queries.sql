-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.


SELECT p.ProductName,
       c.CategoryName
  FROM product AS p
       JOIN
       category AS c ON p.categoryId = c.id;



-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id,
       s.CompanyName
  FROM [order] AS o
       JOIN
       shipper AS s ON o.ShipVia = s.id
 WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.


SELECT p.ProductName,
       o.Quantity
  FROM orderDetail AS o
       JOIN
       product AS p ON o.productId = p.id
 WHERE orderId = 10251;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id,
       c.companyName,
       e.LastName
  FROM [order] AS o
       JOIN
       customer AS c ON o.customerId = c.id
       JOIN
       employee AS e ON o.employeeId = e.id;
