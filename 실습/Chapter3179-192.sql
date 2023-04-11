/* newbook���̺� ���� */

create table NewBook (
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));

select * from NewBook;

/* newcustomer ���̺� ���� */

CREATE TABLE NewCustomer (
custid NUMBER PRIMARY KEY,
name VARCHAR2(20),
address VARCHAR2(20),
phone VARCHAR2(30));


/* neworders���̺� ���� */
create table NewOrders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE);


/* �Ӽ� �߰� */

alter table newbook add isbn varchar2(13);

select * from newbook;

/*������� ���� */

alter table newbook modify isbn number;


select * from newbook;
select * from newcustomer;
select * from neworders;

/*���̺� ���� */
alter table newbook drop column isbn;

select * from book;

/*Ʃ�� �߰� */

insert into book(bookid,bookname,publisher,price)
values(11,'������ ����', '�Ѽ����м���',90000);

insert into book(bookid,bookname,publisher)
values (14,'����������','�Ѽ����м���');


select * from imported_book;

/*�뷮 ���� */
insert into book(bookid, bookname,price,publisher)
select bookid, bookname,price,publisher
from imported_book;

select * from imported_book;
select * from book;

select * from customer;

/*������Ʈ*/

update customer
set address='���ѹα� �λ�'
where custid=5;

select * from customer;

update customer
set address=(select address from customer where name ='�迬��')
where name='�ڼ���';

/*Ʃ�� ����*/
delete from customer
where custid=5;

select * from customer;

rollback;