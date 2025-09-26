use online_book_store;


DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

insert into books (
select * from  
online_bookstore.books);

insert into Customers(
select * from  
online_bookstore.Customers);


insert into Orders(
select * from  
online_bookstore.Orders);

-- selct all books in "fiction" genere

select * from books 
where  genre= "fiction";

-- find the books published after year 1950 

select * from books 
where published_year >= "1950"
order by published_year;

-- list all custmers from canada 

select * from
customers 
where country='canada';

-- Show orders placed in November 2023

select * from 
orders 
where order_date between '2023-11-01' and  '2023-11-30'
order by order_id;

-- Retrieve the total stock of books available

select sum(stock) as total_stock
from books;



--  Find the details of the most expensive book

select * from books
order by price desc
limit 1;

-- Show all customers who ordered more than 1 quantity of a book

select * from 
orders
where quantity>=1
order by quantity;


--  Retrieve all orders where the total amount exceeds $20:

select * from orders
where total_amount>20;

-- List all genres available in the Books table

select distinct genre from books; 

-- Find the book with the lowest stock:

select * from books
order by stock ;

--  Calculate the total revenue generated from all orders 

select sum(total_amount) as revenue
from orders;




-- 1) Retrieve the total number of books sold for each genre

select * from orders;

select b.genre,sum(o.quantity) as total_book_sold
from orders o
join books b on
b.book_id=o.book_id
group by b.genre;


-- Find the average price of books in the "Fantasy" genre
select avg(price)
from books
where genre='fantasy';

-- List customers who have placed at least 2 orders

SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;
 
 select *
 from orders;
 
 
 -- Find the most frequently ordered book:

SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre 

SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;

-- Retrieve the total quantity of books sold by each author

select b.author , sum(o.quantity) as total_book_sold 
from orders o 
join books b on
o.book_id = b.book_id
group by b.author;

-- List the cities where customers who spent over $30 are located

select c.city,total_amount
from orders o
join customers c on 
o.customer_id=c.customer_id
where total_amount>30;

-- Find the customer who spent the most on orders:

SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;


