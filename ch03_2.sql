SELECT *
FROM orders;

/* 마당서점의 도서의 총수 */
SELECT COUNT(*)
FROM book;

/* 마당서점에 도서를 출고하는 출판사의 총수 */
SELECT COUNT(distinct publisher)
FROM book;
/* 모든 고객의 이름, 주소 */
SELECT name.address
FROM customer;

/* 2020년 7월 4일 ~ 7월7일 사이에 주문받은 도서의 주문번호 */
SELECT orderid
FROM orders
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020년 7월 4일 ~ 7월7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
SELECT orderid
FROM orders
WHERE orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07';

/* 성이 '김' 씨인 고객의 이름과 주소*/
SELECT name, address
FROM customer
WHERE name LIKE '김%';

/* 성이 '김' 씨이고 이름이 '아'로 끝나는 고객의 이름과 주소 */
SELECT name, address
FROM customer
WHERE name LIKE '김%아';

/*02 - 8 주문하지 않은 고객의 이름(부속질의 사용) */
SELECT name
FROM customer
WHERE name NOT IN ( 
    SELECT name
    FROM customer, orders
    WHERE customer.custid=orders.custid
);

/*02 - 9 주문 금액의 총액과 주문의 평균 금액 */
SELECT SUM(saleprice), AVG(saleprice)
FROM ORDERS;

/*02 - 10 고객의 이름과 고객별 구매액 */
SELECT name, SUM(saleprice) AS total
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY name;

/*02 - 11 고객의 이름과 고객이 구매한 도서 목록 */
SELECT name, book.bookname
FROM customer, book, orders
WHERE book.bookid = orders.bookid AND customer.custid = orders.custid;

/*02 - 12 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문 */
SELECT *
FROM book, orders
WHERE book.bookid = orders.bookid AND price - saleprice = (
    SELECT MAX(price - saleprice)
    FROM book, orders
    WHERE book.bookid=orders.bookid
);

/*02 - 13 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 */
SELECT name, avg(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY name HAVING avg(saleprice) > (
    SELECT avg(saleprice)
    FROM orders
);
