/* �������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher)
FROM book, orders
WHERE book.bookid = orders.bookid AND orders.custid = 1;

/* �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ���� */
SELECT bookname, price, price-saleprice
FROM book, orders, customer
WHERE book.bookid = orders.bookid AND orders.custid = customer.custid AND customer.name = '������';

/* �������� �������� ���� ������ �̸� */
SELECT DISTINCT BOOK.BOOKNAME
FROM BOOK, ORDERS, CUSTOMER
WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID AND CUSTOMER.NAME != '������';

/* �ֹ����� ���� ���� �̸�(�μ����� ���) */
SELECT NAME
FROM CUSTOMER
WHERE CUSTID NOT IN (SELECT CUSTID
                        FROM ORDERS);

/* �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ� */
SELECT SUM(SALEPRICE), AVG(SALEPRICE)
FROM ORDERS;

/* ���� �̸��� ���� ���ž� */
SELECT CUSTOMER.NAME, SUM(ORDERS.SALEPRICE)
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME;

/* ���� �̸��� ���� ������ ���� ��� */
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM BOOK, CUSTOMER, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID;

/* ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ� */
SELECT ORDERS.*
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND BOOK.PRICE - ORDERS.SALEPRICE = (SELECT MAX(BOOK.PRICE-ORDERS.SALEPRICE)
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID);

/* ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸� */
SELECT NAME
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY NAME HAVING AVG(SALEPRICE) > (SELECT AVG(ORDERS.SALEPRICE)
FROM ORDERS);