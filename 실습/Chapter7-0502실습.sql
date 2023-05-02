---------------------------------------------------------
-- Summer 테이블을 생성하고 데이터를 삽입하는 SQL
---------------------------------------------------------
DROP TABLE Summer; /* 기존 테이블이 있으면 삭제 */

CREATE TABLE Summer
( sid   NUMBER,
  class VARCHAR2(20),
  price NUMBER
);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'FORTRAN', 20000);

SELECT *
FROM   Summer;

SELECT	price "C 수강료"
FROM	Summer 
WHERE	class='C'; 

DELETE	FROM	Summer
WHERE	sid=200;

SELECT	price "C 수강료"
FROM	Summer
WHERE	class='C';

INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

SELECT	*
FROM	Summer;

SELECT	COUNT(*) "수강인원"
FROM	Summer;

SELECT	COUNT(sid) "수강인원"
FROM	Summer;

SELECT	COUNT(*) "수강인원"
FROM	Summer
WHERE	sid IS NOT NULL;

UPDATE	Summer
SET		price=15000
WHERE	class='FORTRAN';

SELECT	*
FROM	Summer;

SELECT	DISTINCT price "FORTRAN 수강료"
FROM	Summer
WHERE	class='FORTRAN';

UPDATE	Summer
SET		price=20000
WHERE	class='FORTRAN';

UPDATE	Summer
SET		price=15000
WHERE	class='FORTRAN' AND sid=100;

SELECT	*
FROM	Summer;

SELECT	price "FORTRAN 수강료"
FROM	Summer
WHERE	class='FORTRAN';

UPDATE	Summer
SET		price=20000
WHERE	class='FORTRAN';

DELETE
FROM	Summer
WHERE	sid IS NULL;

DROP TABLE SummerPrice;
DROP TABLE SummerEnroll;

CREATE TABLE SummerPrice
( class VARCHAR(20),
  price INTEGER
);

INSERT INTO SummerPrice VALUES ('FORTRAN', 20000);
INSERT INTO SummerPrice VALUES ('PASCAL', 15000);
INSERT INTO SummerPrice VALUES ('C', 10000);

SELECT *
FROM   SummerPrice;

CREATE TABLE SummerEnroll
( sid   INTEGER,
 class VARCHAR(20)
);

INSERT INTO SummerEnroll VALUES (100, 'FORTRAN');
INSERT INTO SummerEnroll VALUES (150, 'PASCAL');
INSERT INTO SummerEnroll VALUES (200, 'C');
INSERT INTO SummerEnroll VALUES (250, 'FORTRAN');

SELECT *
FROM SummerEnroll;

SELECT	price "C 수강료"
FROM	SummerPrice
WHERE	class='C';

DELETE	FROM	SummerEnroll
WHERE	sid=200;

SELECT	*
FROM	SummerEnroll;

SELECT	price "C 수강료"
FROM	SummerPrice
WHERE	class='C';

INSERT INTO SummerPrice VALUES ('JAVA', 25000);

SELECT	*
FROM	SummerPrice;

SELECT	*
FROM	SummerEnroll;

UPDATE SummerPrice
SET     price=15000
WHERE  class='FORTRAN';

SELECT price "FORTRAN 수강료"
FROM   SummerPrice
WHERE class='FORTRAN';