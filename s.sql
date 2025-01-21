CREATE TABLE T1_MEMBER(
	custno number(6) not null primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(1),
	city char(2)
);

insert into T1_MEMBER values(100001,'김행복','000-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
insert into T1_MEMBER values(100002,'이축복','000-1111-3333','서울 동대문구 휘경2동','20151206','B','01');
insert into T1_MEMBER values(100003,'장믿음','000-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');
insert into T1_MEMBER values(100004,'최사랑','000-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');
insert into T1_MEMBER values(100005,'진평화','000-1111-6666','제주도 제주시 외나무골','20151225','B','60');
insert into T1_MEMBER values(100006,'차공단','000-1111-7777','제주도 제주시 감나무공','20151211','C','60');

select * from T1_MEMBER;

select max(custno)+1 custno
from T1_MEMBER;

select custno, custname, phone, address, joindate,
case when grade ='A' then 'VIP'
when grade = 'B' then '일반'
when grade = 'C' then '직원'
end grade, city
from T1_MEMBER order by custno;

CREATE TABLE T1_MONEY(
	custno number(6),
	saleno number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,	
	primary key(custno, saleno)
);

drop table T1_MONEY;

insert into T1_MONEY values(100001,20160001,500,5,2500,'A001','20160101');
insert into T1_MONEY values(100002,20160002,1000,4,4000,'A002','20160101');
insert into T1_MONEY values(100003,20160003,500,3,1500,'A008','20160101');
insert into T1_MONEY values(100004,20160004,2000,1,2000,'A004','20160102');
insert into T1_MONEY values(100005,20160005,500,1,500,'A001','20160103');
insert into T1_MONEY values(100006,20160006,1500,2,3000,'A003','20160103');
insert into T1_MONEY values(100007,20160007,500,2,1000,'A001','20160104');
insert into T1_MONEY values(100008,20160008,300,1,300,'A005','20160104');
insert into T1_MONEY values(100009,20160009,600,1,600,'A006','20160104');
insert into T1_MONEY values(100010,20160010,3000,1,3000,'A007','20160106');

select * from T1_MONEY;

SELECT A.custno, A.custname, 
       DECODE(A.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS grade, 
       B.price
FROM T1_MEMBER A, T1_MONEY B
WHERE A.custno = B.custno
GROUP BY A.custno, A.custname, A.grade, B.price
ORDER BY B.price DESC;






