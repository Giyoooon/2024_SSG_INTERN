-- 03_scott.sql
--------------------------------------
--> DML [ ���� ] -> Data : insert , update, delete
-----------------------------
--[ insert ] -
select * from emp2;
insert into emp2(ename,empno,deptno) values ('Tom', 8888,40);
insert into emp2 values ('Alice', 3333,30);
insert into emp2(empno,deptno,ename) values (3434, 10, 'Jane');
insert into emp2 values ('KOR', 9898,null);

select * from emp2;

--> dept2 �� [ 55, MKT, SEOUL ] �Է����ּ���

insert into dept2 values ( 55, 'MKT', 'SEOUL');
select * from dept2;

-----------------------------
--[ update ] -
update Table 
 set column = data,column = data,column = data,,,, ����
where ���� 
--> emp2 ���� �̸��� G �ڰ� �ִ� �������� �μ���ȣ�� 55���� �������ּ��� ;
select deptno
from emp2 
where (ename like '%G%');

update emp2 
 set deptno = 55
where (ename like '%G%');

select * from emp2;
--> emp2 ���� �ҼӺμ��� ���� �������� �μ���ȣ�� 40���� �������ּ��� ;

update emp2
 set deptno = 40
where (deptno is null);

--> emp2 ���� �μ���ȣ�� 40�� �������� �μ���ȣ�� 15 ���� �������ּ��� ;
select deptno
from emp2
where deptno = 40;

update emp2
    set deptno = deptno + 15
where (deptno = 40);

update emp2
 set deptno = deptno +15
where (deptno = 40);

select * from emp2;

--> dept2 ���� 55�� �μ��� �μ����� IT, ��ġ�� ����(NAJU)�� �������ּ���
select dname, loc 
from dept2
where deptno = 55; 

update dept2
set dname = 'IT', loc = 'NAJU' 
where deptno = 55; 

update dept2
 set dname ='IT', loc = 'NAJU'
where deptno = 55;

-----------------------------
select * from emp2;
--[ delete ] -
--> �̸��� 'KOR'�� ������ �����Ͻÿ�
select ename
from emp2
where ename = 'KOR';

delete emp2
where ename = 'KOR';

delete from emp2
where (ename = 'Jane');

select * from emp2;
--> emp2���� empno�� 3�� ����� ������ ����
delete emp2
where ( mod(empno,3) = 0);

--> emp2���� ename�� ���ڰ����� 4 ������ ������ ����
delete emp2
where ( length(ename) <= 4);

select * from emp2;

-----------------------------
--[ merge ] -

--> ������ �Է�, ������ update
merge 
 into emp2 e
using dual
   on (e.empno = 7788)
 when matched then
      update
         set e.deptno = 20
 when not matched then
      insert (e.ename, e.empno, e.deptno)
      values ('SCOTT',7788, 40);

--> ������ ����
merge 
 into emp2 e
using dual
   on (e.empno = 7788)
 when matched then
      update
         set e.deptno = 20
 when not matched then
      insert (e.ename, e.empno, e.deptno)
      values ('SCOTT',7788, 40);

-- [��������] - 
insert into emp2 values ('AAA', 1000, 40);
insert into emp2 values ('AAA', 2000, 40);
insert into emp2 values ('AAA', 3000, 40);

select * from emp2;

merge
    into emp2 e
using dual
    on ((e.empno = 4000) and (e.deptno = 40))
when matched then
    update
        set e.ename = 'BBB'
when not matched then
    insert (e.ename, e.empno, e.deptno)
    values ('AAA', 4000, 40);

--------------------------------------
--> Set (����) ������ (union, union all, intersect, minus);
union       -> ������(�ߺ�����)
union all   -> ������(�ߺ�����)
intersect   -> ������
minus       -> ������ 
--------------------------------------
--> dept2 ����
drop table dept2;
--> dept2 ����
create table dept2
as
select * from dept;

select * from dept2;

--> dept2 ���� R ���ڰ� �ִ� �μ����� �μ���ȣ�� 5�� �������� �����ּ��� 
update dept2
 set deptno = deptno + 5
where (dname like '%R%');
-------------------------------
select * from dept
union all
select * from dept2;

select * from dept
union
select * from dept2;

select ename,empno,ename from emp2
union all
select loc,deptno,dname from dept2;

select * from dept
intersect
select * from dept2;

select * from dept
minus 
select * from dept2;

--------------------------------------