-- ================================================
-- BOOKSTORE DATABASE ANALYSIS
-- Tool : PostgreSQL
-- Description: SQL project analyzing bookstore data
--              including books, customers and orders
-- ================================================

-- 1) Retrieve all books in the "Fiction" genre:
select * from book where genre = 'Fiction';


-- 2) Find books published after the year 1950:
select * from book where published_year>1950;

-- 3) List all customers from the Canada:
select * from customers where country = 'Canada';

-- 4) Show orders placed in November 2023:
select * from orders 
where order_date Between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:
select sum(stock) as Total_Stock 
from Book ;

-- 6) Find the details of the most expensive book:
select * from Book
order by Price DESC 
Limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from orders 
where quantity >1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders 
where total_amount >20;

-- 9) List all genres available in the Books table:
select distinct genre from Book ;

-- 10) Find the book with the lowest stock:
select * from Book
Order by stock 
limit 1;

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount)as Revenue from Orders; 

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select * from orders;

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Book b ON o.book_id = b.book_id
GROUP BY b.Genre;


-- 2) Find the average price of books in the "Fantasy" genre:
select avg(price) as Average_Price 
From Book
Where Genre = 'Fantasy';


-- 3) List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- 4) Find the most frequently ordered book:
select o.book_id ,b.title, count(order_id) as Order_count
from orders o 
join book b on o.book_id=b.book_id
Group by o.Book_id, b.title 
order by Order_count DESC limit 1 ;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from book 
where genre = 'Fantasy'
order by price DESC limit 3 ;

-- 6) Retrieve the total quantity of books sold by each author:
select b.author ,SUM(o.Quantity) as total_books_sold
from orders o 
join book b ON o.book_id=b.book_id
Group by b.Author;

-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;



-- 8) Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM book b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;


-- My Additional Analysis :

-- A) Which month had the highest revenue?
SELECT TO_CHAR(order_date, 'YYYY-MM') AS Month,
SUM(total_amount) AS Monthly_Revenue
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY Monthly_Revenue DESC
LIMIT 1;

-- B) Which country has the most customers?
SELECT country, COUNT(customer_id) AS Total_Customers
FROM customers
GROUP BY country
ORDER BY Total_Customers DESC
LIMIT 1;

-- C) Find authors whose books have never been ordered:
SELECT b.author, b.title
FROM book b
LEFT JOIN orders o ON b.book_id = o.book_id
WHERE o.order_id IS NULL;

-- D) Average order value per customer:
SELECT c.name, 
ROUND(AVG(o.total_amount), 2) AS Avg_Order_Value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY Avg_Order_Value DESC;











