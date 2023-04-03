SELECT *
FROM orders;

/* ���缭���� ������ �Ѽ� */
SELECT COUNT(*)
FROM book;

/* ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ� */
SELECT COUNT(distinct publisher)
FROM book;
/* ��� ���� �̸�, �ּ� */
SELECT name.address
FROM customer;

/* 2020�� 7�� 4�� ~ 7��7�� ���̿� �ֹ����� ������ �ֹ���ȣ */
SELECT orderid
FROM orders
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020�� 7�� 4�� ~ 7��7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
SELECT orderid
FROM orders
WHERE orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07';

/* ���� '��' ���� ���� �̸��� �ּ�*/
SELECT name, address
FROM customer
WHERE name LIKE '��%';

/* ���� '��' ���̰� �̸��� '��'�� ������ ���� �̸��� �ּ� */
SELECT name, address
FROM customer
WHERE name LIKE '��%��';
