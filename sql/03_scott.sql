-- 03_scott.sql
--------------------------------------
--> DML [ 조작 ] -> Data : insert , update, delete
-----------------------------
--[ insert ] -
select * from emp2;
insert into emp2(ename,empno,deptno) values ('Tom', 8888,40);
insert into emp2 values ('Alice', 3333,30);
insert into emp2(empno,deptno,ename) values (3434, 10, 'Jane');
insert into emp2 values ('KOR', 9898,null);

select * from emp2;

--> dept2 에 [ 55, MKT, SEOUL ] 입력해주세요

insert into dept2 values ( 55, 'MKT', 'SEOUL');
select * from dept2;

-----------------------------
--[ update ] -
update Table 
 set column = data,column = data,column = data,,,, 변경
where 조건 
--> emp2 에서 이름에 G 자가 있는 직원들의 부서번호를 55으로 변경해주세요 ;
select deptno
from emp2 
where (ename like '%G%');

update emp2 
 set deptno = 55
where (ename like '%G%');

select * from emp2;
--> emp2 에서 소속부서가 없는 직원들의 부서번호를 40으로 변경해주세요 ;

update emp2
 set deptno = 40
where (deptno is null);

--> emp2 에서 부서번호를 40인 직원들의 부서번호를 15 더해 변경해주세요 ;
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

--> dept2 에서 55번 부서의 부서명은 IT, 위치는 나주(NAJU)로 변경해주세요
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
--> 이름이 'KOR'인 직원을 삭제하시오
select ename
from emp2
where ename = 'KOR';

delete emp2
where ename = 'KOR';

delete from emp2
where (ename = 'Jane');

select * from emp2;
--> emp2에서 empno가 3의 배수인 직원만 삭제
delete emp2
where ( mod(empno,3) = 0);

--> emp2에서 ename의 글자개수가 4 이하인 직원만 삭제
delete emp2
where ( length(ename) <= 4);

select * from emp2;

-----------------------------
--[ merge ] -

--> 없으면 입력, 있으면 update
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

--> 있으면 수정
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

-- [복수조건] - 
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
--> Set (집합) 연산자 (union, union all, intersect, minus);
union       -> 합집합(중복제거)
union all   -> 합집합(중복포함)
intersect   -> 교집합
minus       -> 차집합 
--------------------------------------
--> dept2 제거
drop table dept2;
--> dept2 생성
create table dept2
as
select * from dept;

select * from dept2;

--> dept2 에서 R 문자가 있는 부서들의 부서번호를 5씩 증가시켜 보여주세요 
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