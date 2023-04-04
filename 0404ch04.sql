/* ���� �ܺ�����(*) */
SELECT name,saleprice
FROM customer LEFT OUTER JOIN orders on customer.custid=orders.custid;

/* ���� �ܺ�����(*) */
SELECT customer.name, saleprice
FROM customer, orders
WHERE customer.custid=orders.custid(+);

/* ���� ��� ������ ���� ǥ�� */
SELECT MAX(price)
FROM book;

/* ���� ��� ������ �̸� */
SELECT bookname
FROM book
WHERE price=35000;

/* ���� ��� ������ �̸� */
SELECT bookname
FROM book
WHERE price=(SELECT MAX(price)
                FROM book);
                
/* ������ �ֹ������� �ִ� �� ���̵� ã�� */
SELECT custid
FROM orders;
    
/* �� ���̵� �ش��ϴ� �� �̸� ã�� */
SELECT name
FROM customer
WHERE custid IN (1,2,3,4);

/* �� ���̵� �ش��ϴ� �� �̸� ã�� */
SELECT name
FROM customer
WHERE custid IN (SELECT custid
                    FROM orders);

/* ���ǻ纰 ���ǻ��� ��� ���� ���ݺ��� ��� ���� */
SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT avg(b2.price)
                    FROM book b2
                    WHERE b2.publisher=b1.publisher);