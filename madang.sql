SELECT bookname
FROM book
WHERE bookid = 1;

SELECT bookname
FROM book
WHERE price >= 20000;

SELECT SUM(saleprice) 
FROM orders
WHERE custid = 1;

SELECT COUNT(*)
FROM orders
WHERE custid = 1;

SELECT COUNT(*) AS total_books
FROM Book;

SELECT COUNT(DISTINCT publisher) AS total_publishers
FROM Book;

SELECT name, address
FROM Customer;