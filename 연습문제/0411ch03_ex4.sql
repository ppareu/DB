--(1)
insert into book values(13, '스포츠 세계', '대한미디어', 10000);
SELECT * FROM book;

--(2)
delete from book where publisher='삼성당';
SELECT * FROM book;

--(3) 왜래키로 참조하고 있기 때문에 무결성 제약조건에 위배

--(4)
update book set publisher='대한출판사' where publisher like '대한미디어';
SELECT * FROM book;
