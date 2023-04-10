/*01 - 5 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(distinct publisher)
FROM customer, book, orders
WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '박지성';

/*01 - 6 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
SELECT bookname, price, price-saleprice
FROM customer, book, orders
WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '박지성';

/*01 - 7 박지성이 구매하지 않은 도서의 이름 */
SELECT bookname
FROM book
WHERE NOT EXISTS (
    SELECT bookname
    FROM customer, orders
    WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '박지성'
);

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