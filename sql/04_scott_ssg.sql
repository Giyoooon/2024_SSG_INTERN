-- 04_scott.sql

Table 구성 
DDL ( create, alter, drop )

Data 무결성 => DataType, Constraint (제약조건) 정의

--> 데이터 무결성

--1) Column의 DateType 선언

	- 정해진 DataType 외에는 못들어오게 할 수 있다.
	- Size 지정

--2) Constraints (제약조건) : 5 + 1
  1> PK(Primary Key): Unique(중복불가) + Null(X) + 1/Table + Unique Index
  2> UQ(Unique)		: Unique(중복불가) + Null(N) + n/Table + Unique Index
  
  3> FK(Foreign Key): 자기/다른 Table 의 Unique 한 Column 참조
  4> CK(Check)		: 범위조건 , 열거조건 을 통한 제한
  5> NN(Not Null)	: Null 허용 여부
  ---------------------------------------------
  6> DF(Default)	: default(기본값) 제공 
  
  --------------------------------------------------
drop table CustTbl;  
  
create table CustTbl (
    cno number(2) primary key,
    cname varchar2(10) unique not null,
    gender char(1) check(gender in ('F','M')) not null,
    age number(3) check(age between 1 and 130) not null,
    job varchar2(20),
    addr varchar2(10),
    mob1 char(3) default('010') check(mob1 in('010','011','019')) ,
    mob2 char(8) ,
    cdate date default sysdate
);

drop table CustTbl;  
  
create table CustTbl (
    cno number(2) ,
    cname varchar2(10) not null,
    gender char(1) not null,
    age number(3)  not null,
    job varchar2(20),
    addr varchar2(10),
    mob1 char(3) default('010') ,
    mob2 char(8) ,
    cdate date default sysdate,
    constraint CT_PK_CNO primary key(cno),
    constraint CT_UQ_CNAME unique(cname),
    constraint CT_CK_GENDER check(gender in ('F','M')),
    constraint CT_CK_AGE check(age between 1 and 130),
    constraint CT_CK_MOB1 check(mob1 in('010','011','019'))
);  

----------------------------
drop table BuyTbl;

create table BuyTbl (
    bno number(2),
    bname varchar2(10),
    price number(4),
    amount number(3),
    cno number(2),
    constraint BT_PK_BNO primary key(bno),
    constraint BT_FK_CNO_CT_CNO foreign key(cno) references CustTbl(cno)
); 
----------------------------
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';

insert into CustTbl values 
(1, '홍길동', 'M',50 ,'IT', '나주','010','11111111', default );

insert into CustTbl values 
(2, '신슬기', 'F', 30 ,'AD', '서울','011','22222222', default );

select * from CustTbl;

insert into BuyTbl values (1, 'Cup', 1000, 2, 2);

insert into BuyTbl values (2, 'Book', 500, 3, 1);

select * 
from CustTbl c, BuyTbl b
where (c.cno = b.cno);
--------------------------------------------
select * from BuyTbl;

desc BuyTbl;  

alter table BuyTbl
 add Cmmt varchar2(20);
 
select * from BuyTbl;
-----------------------------------
-----------------------------------
BuyTbl: Amount -> check (1 ~ 100)

alter table BuyTbl
 add constraint BT_CK_AMOUNT check(amount between 1 and 100);

alter table BuyTbl
 drop constraint BT_CK_AMOUNT;

alter table BuyTbl
 add constraint BT_CK_AMOUNT check(amount between 1 and 200);

insert into BuyTbl values (3, 'Pen', 300, 100, 2,'Test');

select * from BuyTbl;

alter table BuyTbl
 modify cmmt not null;

select * from BuyTbl;

alter table BuyTbl
 modify cmmt varchar2(30);

alter table BuyTbl
 modify cmmt varchar2(4);

alter table BuyTbl
 drop column cmmt ;
 
alter table BuyTbl
 drop constraint BT_CK_AMOUNT ;  
  
  
  
  
  


