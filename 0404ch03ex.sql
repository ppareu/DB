/*01 - 5 �������� ������ ������ ���ǻ� ��*/
SELECT COUNT(distinct publisher)
FROM customer, book, orders
WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '������';

/*01 - 6 �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ���� */
SELECT bookname, price, price-saleprice
FROM customer, book, orders
WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '������';

/*01 - 7 �������� �������� ���� ������ �̸� */
SELECT bookname
FROM book
WHERE NOT EXISTS (
    SELECT bookname
    FROM customer, orders
    WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '������'
);

/*02 - 8 �ֹ����� ���� ���� �̸�(�μ����� ���) */
SELECT name
FROM customer
WHERE name NOT IN ( 
    SELECT name
    FROM customer, orders
    WHERE customer.custid=orders.custid
);

/*02 - 9 �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ� */
SELECT SUM(saleprice), AVG(saleprice)
FROM ORDERS;

/*02 - 10 ���� �̸��� ���� ���ž� */
SELECT name, SUM(saleprice) AS total
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY name;

/*02 - 11 ���� �̸��� ���� ������ ���� ��� */
SELECT name, book.bookname
FROM customer, book, orders
WHERE book.bookid = orders.bookid AND customer.custid = orders.custid;

/*02 - 12 ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ� */
SELECT *
FROM book, orders
WHERE book.bookid = orders.bookid AND price - saleprice = (
    SELECT MAX(price - saleprice)
    FROM book, orders
    WHERE book.bookid=orders.bookid
);

/*02 - 13 ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸� */
SELECT name, avg(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY name HAVING avg(saleprice) > (
    SELECT avg(saleprice)
    FROM orders
);