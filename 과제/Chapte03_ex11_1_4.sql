/*극장 테이블 생성*/
CREATE TABLE Theater(
theaternumber NUMBER PRIMARY KEY,
theatername VARCHAR2(10),
location VARCHAR2(10));

/*상영관 테이블 생성*/
CREATE TABLE atheater(
theaternumber NUMBER,
atheaternumber NUMBER CHECK(atheaternumber>=1 and atheaternumber<=10),
moviename VARCHAR2(20),
price NUMBER CHECK(price<=20000),
seat NUMBER,
FOREIGN KEY(theaternumber) REFERENCES theater(theaternumber) ON DELETE CASCADE);

DROP TABLE atheater;
DROP TABLE theater;
DROP TABLE Reservation;
DROP TABLE cust;

/*예약 테이블 생성*/
CREATE TABLE Reservation(
theaternumber NUMBER,
atheaternumber NUMBER CHECK(atheaternumber>=1 and atheaternumber<=10),
custid NUMBER PRIMARY KEY,
seatid NUMBER,
day DATE,
FOREIGN KEY(theaternumber) REFERENCES theater(theaternumber) ON DELETE CASCADE);


/*고객 테이블 생성*/
CREATE TABLE cust(
custid NUMBER PRIMARY KEY,
name VARCHAR2(10),
address VARCHAR2(10),
FOREIGN KEY(custid) REFERENCES Reservation(custid));

INSERT INTO Theater values(1,'롯데','잠실');
INSERT INTO Theater values(2,'메가','강남');
INSERT INTO Theater values(3,'대한','잠실');

INSERT INTO aTheater values(1,1,'어려운 영화',15000,48);
INSERT INTO aTheater values(3,1,'멋진 영화',7500,120);
INSERT INTO aTheater values(3,2,'재밌는 영화',8000,110);

INSERT INTO Reservation values(3,2,3,15,'2020-09-01');
INSERT INTO Reservation values(3,1,4,16,'2020-09-01');
INSERT INTO Reservation values(1,1,9,48,'2020-09-01');

INSERT INTO cust values(3,'홍길동','강남');
INSERT INTO cust values(4,'김철수','잠실');
INSERT INTO cust values(9,'박영희','강남');

/* [극장 데이터베이스] 다음은 네 개의 지점을 둔 극장 데이터베이스이다. 밑줄 친 속성은 기본키이다.
테이블의 구조를 만들고 데이터를 입력한 후 다음 질의에 대한 SQL 문을 작성하시오. 테이블 구조를 만들 때 다음 제약조건을 반영하여 작성한다.*/

/* 1 - (1) 모든 극장의 이름과 위치를 보이시오. */
SElECT 극장이름, 위치
FROM 극장;

/* 1 - (2) '잠실'에 있는 극장을 보이시오. */
SELECT *
FROM 극장
WHERE 위치 LIKE '잠실';

/* 1 - (3) '잠실'에 사는 고객의 이름을 오름차순으로 보이시오. */
SELECT 이름
FROM 고객
WHERE 주소 LIKE '잠실'
ORDER BY 이름;

/* 1 - (4) 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오. */
SELECT 극장번호, 상영관번호, 영화제목
FROM 상영관
WHERE 가격 <= 8000;

/* 1 - (5) 극장 위치와 고객의 주소가 같은 고객을 보이시오. */
SELECT DISTINCT 고객.이름, 극장.위치
FROM 극장, 고객
WHERE 극장.위치 = 고객.주소;


-----------------------------------------------------------------------------

/* 2 - (1)  극장의 수는 몇 개인가?*/
SELECT COUNT(극장번호)
FROM 극장;

/* 2 - (2) 상영되는 영화의 평균 가격은 얼마인가? */
SELECT AVG(가격)
FROM 상영관;

/* 2 - (3) 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가? */
SELECT COUNT(고객번호)
FROM 예약
WHERE 날짜 = '2020-09-01';

-----------------------------------------------------------------------------


/* 3 - (1) '대한'극장에서 상영된 영화제목을 보이시오. */
SELECT 영화제목
FROM 상영관, 극장
WHERE 극장.극장번호 = 상영관.극장번호 AND 극장이름 LIKE '대한';

/* 3 - (2) '대한'극장에서 영화를 본 고객의 이름을 보이시오. */
SELECT 이름
FROM 극장, 예약, 고객
WHERE 극장.극장번호 = 예약.극장번호 AND 예약.고객번호 = 고객.고객번호 AND 극장.극장이름 = '대한';

/* 3 - (3) '대한'극장의 전체 수입을 보이시오. */
SELECT SUM(가격)
FROM 극장, 상영관
WHERE 극장.극장번호 = 상영관.극장번호 AND 극장이름 = '대한';


-----------------------------------------------------------------------------


/* 4 - (1) 극장별 상영관 수를 보이시오. */
SELECT 극장.극장이름, COUNT(상영관번호)
FROM 극장, 상영관
WHERE 극장.극장번호 = 상영관.극장번호
GROUP BY 극장이름;

/* 4 - (2) '잠실'에 있는 극장의 상영관을 보이시오. */
SELECT DISTINCT 극장이름, 상영관번호
FROM 극장, 상영관
WHERE 극장.극장번호 = 상영관.극장번호 AND 위치 = '잠실';

/* 4 - (3) 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오. */
SELECT COUNT(*), 극장.극장이름
FROM 극장, 예약
WHERE 극장.극장번호 = 예약.극장번호 AND 날짜 = '2020-09-01'
GROUP BY 예약.극장번호, 극장.극장이름;

/* 4 - (4) 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오. */
SELECT MAX(COUNT(고객번호))
FROM 상영관, 예약
WHERE 상영관.극장번호 = 예약.극장번호 AND 상영관.상영관번호 = 예약.상영관번호 AND 날짜 = '2020-09-01'
GROUP BY 영화제목
