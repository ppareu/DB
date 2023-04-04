/* 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher)
FROM book, orders
WHERE book.bookid = orders.bookid AND orders.custid = 1;

/* 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
SELECT bookname, price, price-saleprice
FROM book, orders, customer
WHERE book.bookid = orders.bookid AND orders.custid = customer.custid AND customer.name = '박지성';

/* 박지성이 구매하지 않은 도서의 이름 */
SELECT DISTINCT BOOK.BOOKNAME
FROM BOOK, ORDERS, CUSTOMER
WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID AND CUSTOMER.NAME != '박지성';

/* 주문하지 않은 고객의 이름(부속질의 사용) */
SELECT NAME
FROM CUSTOMER
WHERE CUSTID NOT IN (SELECT CUSTID
                        FROM ORDERS);

/* 주문 금액의 총액과 주문의 평균 금액 */
SELECT SUM(SALEPRICE), AVG(SALEPRICE)
FROM ORDERS;

/* 고객의 이름과 고객별 구매액 */
SELECT CUSTOMER.NAME, SUM(ORDERS.SALEPRICE)
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME;

/* 고객의 이름과 고객이 구매한 도서 목록 */
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM BOOK, CUSTOMER, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID;

/* 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문 */
SELECT ORDERS.*
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND BOOK.PRICE - ORDERS.SALEPRICE = (SELECT MAX(BOOK.PRICE-ORDERS.SALEPRICE)
FROM BOOK, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID);

/* 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 */
SELECT NAME
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY NAME HAVING AVG(SALEPRICE) > (SELECT AVG(ORDERS.SALEPRICE)
FROM ORDERS);