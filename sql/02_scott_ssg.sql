-- 02_scott.sql 

--> ������ ã�ƺ����� (^*^)

���̽��� �μ����� ?

select dname
from emp, dept
-- where ( 20 = 20 )
where ( emp.deptno = dept.deptno )
 and  (ename = 'SMITH');

RESEARCH �μ� �Ҽ��������� �̸��� ?

select ename
from dept, emp
where ( dept.deptno = emp.deptno )
 and ( dname = 'RESEARCH');

CLERK ������ �ϴ� �������� �̸�, ���, �μ���, �μ���ġ��?

select ename, empno, dname, loc 
from emp, dept
where ( dept.deptno = emp.deptno )
 and ( job = 'CLERK' );


-------------------------------------
DALLAS ���� ���ϴ� �������� �μ���, �μ���ȣ, �μ���ġ, �̸�, �����? 

select d.dname, d.deptno, d.loc, e.ename, e.empno
from dept d, emp e
where ( d.deptno = e.deptno)
 and  ( d.loc = 'DALLAS' );


A�ڷ� �����ϴ� �̸��� ���� �������� �̸�, ���, �μ�����?

select e.ename, e.empno, d.dname
from emp e, dept d
where  ( e.deptno = d.deptno )
 and  ( e.ename like 'A%' );

�޿��� 2000 �̻��� �������� �̸�, �μ���, �޿�, ��ġ��?

select e.ename, d.dname, e.sal, d.loc
from emp e, dept d
where ( e.deptno = d.deptno )
 and  ( e.sal >= 2000 );

�޿��� 1500 ~ 2500 ������ �������� �̸�, �μ���, �޿���?

select e.ename, d.dname, e.sal
from emp e, dept d
where ( e.deptno = d.deptno )
 and  ( e.sal between 1500 and 2500 );

1�� ������ 20000 �� �Ѵ� �������� �̸�, �μ���, 1�� ���Աݾ���?

select e.ename, d.dname, ((e.sal*12) + nvl(comm,0)) "1�� ���Աݾ�"
from emp e, dept d
where ( e.deptno = d.deptno )
 and ( ((e.sal*12) + nvl(comm,0)) > 20000);

�μ��� ��� �޿��� 2000�� �Ѵ� �μ��� ��ձ޿���?

select d.dname, avg(e.sal)
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname
having ( avg(e.sal) > 2000);

--------------------------------------------------

--> ������ ã�ƺ����� (^*^)

���̽��� �޿������ ?

select s.grade
from emp e, salgrade s
--where ( e s )
--where ( 700 <= 800 <= 1200 )
--where ( (700 <= 800) and ( 800 <= 1200 ) )
--where ( (s.losal <= e.sal) and ( e.sal <= s.hisal ) )
--where ( 800 between 700 and 1200 )
where ( e.sal between s.losal and s.hisal )
 and ( e.ename ='SMITH');
 
-------------------------------------------------------------
3����� �޿������ ������ �ִ� �������� �̸�, �޿�, �޿������?

select e.ename, e.sal, s.grade
from salgrade s, emp e
where ( e.sal between s.losal and s.hisal )
 and  ( s.grade = 3 );

�޿���޺� �������� ?

select s.grade,count(e.empno)
from salgrade s, emp e
where ( e.sal between s.losal and s.hisal )
group by s.grade;


�޿���޺� �������� 3�� �̻��� �޿���ް� �������� ?

select s.grade,count(e.empno)
from salgrade s, emp e
where ( e.sal between s.losal and s.hisal )
group by s.grade
having (count(e.empno) >= 3);

-----------------------------------------------------------------
�޿������ 3����� �������� �޿����, �̸�, ���, �μ�����?

select s.grade , e.ename, e.empno, d.dname
from salgrade s, emp e, dept d
where ( e.sal between s.losal and s.hisal )
 and  ( d.deptno = e.deptno )
 and  ( s.grade = 3 );

��ī�� �ٹ��ϴ� �������� �̸�, �μ���, ��ġ, �޿�, �޿������?

select e.ename, d.dname, d.loc, e.sal, s.grade
from dept d, emp e, salgrade s
where ( d.deptno = e.deptno )
 and  ( e.sal between s.losal and s.hisal )
 and  ( d.loc = 'CHICAGO');

--------------------------------------------------

--> ������ ã�ƺ����� (^*^)

 SMITH�� ���ӻ�� �̸��� ?;
 
select ee.ename, me.ename
from emp ee, emp me
where ( ee.mgr = me.empno)
 and  ( ee.ename = 'SMITH');
 
KING�� �̸�, ��� �׸���, �׸� ���ӻ������ �� ���������� �̸��� �����?

select me.ename, me.empno, ee.ename, ee.empno
from emp me, emp ee
where ( me.empno = ee.mgr )
 and  ( me.ename = 'KING' );

-----------------------------------------------------------
1��� �޿������ ���� �������� �̸�, �޿�,�޿����, ���ӻ���̸���?

select ee.ename, ee.sal, es.grade, me.ename
from salgrade es, emp ee, emp me
where ( ee.sal between es.losal and es.hisal )
 and ( ee.mgr = me.empno )
 and ( es.grade = 1 );

SALES �μ��� �μ���, �Ҽ� �����̸�, ���, �޿�, �޿����, ���ӻ���̸�, ��������?

select ed.dname, ee.ename, ee.empno, ee.sal, es.grade, me.ename, me.empno
from dept ed, emp ee, salgrade es, emp me
where ( ed.deptno = ee.deptno )
 and  ( ee.sal between es.losal and es.hisal )
 and  ( ee.mgr = me.empno )
 and  ( ed.dname = 'SALES' );
 
King�� �̸�, job, �μ���� 
���� ������������ �̸�,  job, �μ�����?

select me.ename, me.job, dd.dname, ee.ename, ee.job, dd.dname
from emp me, emp ee, dept dd
where ( me.empno = ee.mgr )
 and  ( me.deptno = dd.deptno )
 and  ( ee.deptno = dd.deptno ) 
 and  ( me.ename = 'KING');
 
select me.ename, me.job,md.dname, ee.ename, ee.job, ed.dname
from emp me, emp ee, dept md, dept ed
where ( me.empno = ee.mgr )
 and  ( me.deptno = md.deptno )
 and  ( ee.deptno = ed.deptno ) 
 and  ( me.ename = 'KING');
 
 
----------------------------------------------------------------- 
BLAKE�� �̸�, ���, �޿�, �޿����, �μ���, ����� �̸�, ���, �μ�����?

select ee.ename, ee.empno, ee.sal, es.grade, ed.dname, me.ename, me.empno, md.dname
from emp ee, salgrade es, dept ed, emp me, dept md
where ( ee.sal between es.losal and es.hisal )
 and  ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno )
 and  ( me.deptno = md.deptno )
 and  ( ee.ename = 'BLAKE' );

King�� �̸�, job, �޿�, �޿����, �μ���� 
���� ������������ �̸�,  job, �޿�, �޿����,�μ�����?

select  me.ename, me.job, me.sal, ms.grade, md.dname,
        ee.ename, ee.job, ee.sal, es.grade, ed.dname
from emp ee, salgrade es, dept ed, emp me, dept md, salgrade ms 
where ( ee.sal between es.losal and es.hisal )
 and  ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno )
 and  ( me.deptno = md.deptno )
 and  ( me.sal between ms.losal and ms.hisal )
 and  ( me.ename = 'KING');

----------------------------------------------------------------- 
--> Outer Join , ANSI Join
------------------------------------------------
create table dept2
as
select * from dept;

drop table emp2;
create table emp2
as
select ename, empno, deptno from emp
where (ename like '%ER') or (ename like '%ES');

insert into emp2 values('SSG',9999,null);
------------------------------------------------
select * from emp2;
select * from dept2;

select * 
from emp2 e , dept2 d
where (e.deptno = d.deptno);

select * 
from emp2 e , dept2 d
where (e.deptno = d.deptno(+));

select * 
from emp2 e , dept2 d
where (e.deptno(+) = d.deptno);

select * 
from emp2 e , dept2 d
where (e.deptno(+) = d.deptno(+));

select * 
from emp2 e full outer join dept2 d on (e.deptno = d.deptno);

���ӽ��� �̸��� �μ����� ?

select e.ename, d.dname
from emp2 e, dept2 d
where ( e.deptno = d.deptno )
 and  ( e.ename = 'JAMES');

select e.ename, d.dname
from emp2 e join dept2 d on ( e.deptno = d.deptno )
 and  ( e.ename = 'JAMES');

select e.ename, d.dname
from emp2 e inner join dept2 d on ( e.deptno = d.deptno )
where  ( e.ename = 'JAMES');

select e.ename, d.dname
from emp2 e inner join dept2 d using(deptno)
where  ( e.ename = 'JAMES');

select e.ename, d.dname
from emp2 e natural join dept2 d
where  ( e.ename = 'JAMES');

select e.ename, d.dname
from emp2 e cross join dept2 d;
-------------------------------------------------

���̽��� �޿������?

select e.ename, s.grade
from emp e inner join salgrade s on ( e.sal between s.losal and s.hisal )
where ( e.ename = 'SMITH' );


3�޿������ ������ �̸�, �޿�, �μ�����?

select e.ename, e.sal, s.grade, d.dname 
from salgrade s join emp e on ( e.sal between s.losal and s.hisal )
                join dept d on ( e.deptno = d.deptno )
where ( s.grade = 3 );

KING�� �̸�, job, �μ���� ������������ �̸�, job, �μ�����?

select me.ename, me.job, md.dname, ee.ename, ee.job, ed.dname
from emp me join dept md on ( me.deptno = md.deptno )
            join emp ee on  ( ee.mgr = me.empno )
            join dept ed on ( ee.deptno = ed.deptno )
where ( me.ename = 'KING' );

select me.ename, me.job, md.dname, ee.ename, ee.job, ed.dname
from emp me join dept md using ( deptno )
            inner join emp ee on  ( ee.mgr = me.empno )
            join dept ed on ( ee.deptno = ed.deptno )
where ( me.ename = 'KING' );


KING�� �̸�, job�� ������������ �̸�, job, �޿�, �޿����, �μ����� ?

select me.ename, me.job, ee.ename, ee.job, ee.sal, es.grade, ed.dname
from emp me join emp ee on ( me.empno = ee.mgr )
            join salgrade es on ( ee.sal between es.losal and es.hisal )
            join dept ed on ( ee.deptno = ed.deptno )
where ( me.ename = 'KING' );

------------------------------------
select * 
from emp2 e , dept2 d
where (e.deptno = d.deptno(+));

select *
from emp2 e left outer join dept2 d using(deptno);

select *
from emp2 e left join dept2 d using(deptno);

select *
from emp2 e right outer join dept2 d using(deptno);

select *
from emp2 e right join dept2 d using(deptno);

select *
from emp2 e full outer join dept2 d using(deptno);

select *
from emp2 e full join dept2 d using(deptno);

----------------------------------------------------------
 
�μ��� �ο����� ? 
(��, ��� �μ��� �� ���;� ��);

select d.dname, count(e.empno)
from dept d, emp e
where (d.deptno = e.deptno(+))
group by d.dname;

select d.dname, count(e.empno)
from dept d left outer join emp e on (d.deptno = e.deptno(+))
group by d.dname;

�μ��� �޿��հ�� ? 
(��, ��� �μ��� �� ���;� ��);

select d.dname, sum(e.sal)
from dept d, emp e
where (d.deptno = e.deptno(+))
group by d.dname;

select d.dname, sum(e.sal)
from dept d left outer join emp e on (d.deptno = e.deptno(+))
group by d.dname;

�μ��� �޿��հ谡 8000 ������ �μ���� �޿��հ�� ? 
(��, ��� �μ��� �� ���;� ��);

select d.dname, sum(e.sal)
from dept d, emp e
where (d.deptno = e.deptno(+))
group by d.dname
having (sum(e.sal) <= 8000);

select d.dname, sum(e.sal)
from dept d left outer join emp e on (d.deptno = e.deptno(+))
group by d.dname
having (sum(e.sal) <= 8000);

--------------------------------------
MARTIN �� ���� �޿��� �޴� �������� �̸�, �޿���?

1) MARTIN �� ���� �޿� ?

select sal
from emp 
where (ename = 'MARTIN');

2) 1250 �޿��� �޴� �������� �̸�, �޿���?

select ename, sal
from emp
where ( sal = 1250);

3) �� ��

select ename, sal
from emp
where ( sal = ( select sal
                from emp 
                where (ename = 'MARTIN') ));

--------------------------------------
-- [ ���� �� �� ] --
--MARTIN �� ���� �޿��� �޴� �������� �̸�, �޿���?

--select e2.ename, e2.sal
--from emp e1, emp e2
--where ( e1.sal = e2.sal )
-- and  ( e1.ename = 'MARTIN');

-----------------------------------------
�������� ��ձ޿����� �޿��� ���� �޴� �������� �̸�, ���, �޿���?  

1) �������� ��ձ޿�

select avg(sal)
from emp;

2) 2077 ���� �޿��� ���� �޴� �������� �̸�, ���, �޿���?  

select ename, empno, sal
from emp
where ( sal  > 2077 );


3) �� ��

select ename, empno, sal
from emp
where ( sal  > (select avg(sal)
                from emp ) );

-------------------------------
sales�μ��� �μ� ��ձ޿����� �޿��� ���� �޴� 
 �������� �̸�, �޿�, �޿����, �μ�����? 

1) sales�μ��� �μ� ��ձ޿� ?

select avg(e.sal)
from dept d, emp e
where ( d.deptno = e.deptno )
 and ( d.dname ='SALES');
 
2) 1566 �޿����� �޿��� ���� �޴� �������� �̸�, �޿�, �޿����, �μ�����? 

select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where ( e.sal between s.losal and s.hisal)
 and  ( e.deptno = d.deptno )
 and  ( e.sal > 1566);

3) �� ��
select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where ( e.sal between s.losal and s.hisal)
 and  ( e.deptno = d.deptno )
 and  ( e.sal >  ( select avg(e.sal)
                    from dept d, emp e
                    where ( d.deptno = e.deptno )
                     and ( d.dname ='SALES') ) );
 
-----------------------------------------
SALESMAN ����(JOB)�� �ϴ� �������� �޿����� 
�޿��� ���� �޴� �������� �̸�, �޿�, ����(JOB)�� ?

1) SALESMAN ����(JOB)�� �ϴ� �������� �޿� ?

select sal
from emp 
where (job = 'SALESMAN');

2) 1600 �޿����� �޿��� ���� �޴� �������� �̸�, �޿�, ����(JOB)�� ?

select ename, sal, job
from emp 
where ( sal > 1600 );

3) �� �� 
-> all, any
select ename, sal, job
from emp 
where ( sal > any( select sal
                from emp 
                where (job = 'SALESMAN')) );

select ename, sal, job
from emp 
where ( sal > ( select max(sal)
                from emp 
                where (job = 'SALESMAN')) );

-----------------------------------
RESEARCH �μ�, DALLAS ��ġ���� �ٹ��ϴ� �������� �̸�, ���, �μ���, ��ġ�� ?

select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  ( d.dname = 'RESEARCH')
 and  ( d.loc = 'DALLAS');
 
 select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 --and  (d.dname, d.loc) = (('RESEARCH', 'DALLAS'),('SALES','CHICAGO'));
 and  (d.dname, d.loc) in (('RESEARCH', 'DALLAS'));
 
SMITH�� ���� �μ�, ���� ��ġ���� �ٹ��ϴ� �������� �̸�, ���, �μ���, ��ġ�� ?

1) SMITH�� ���� �μ�, ���� ��ġ ?

select d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
 and  ( e.ename = 'SMITH');

2) ���� �μ�, ���� ��ġ���� �ٹ��ϴ� �������� �̸�, ���, �μ���, ��ġ�� ?

select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  ( d.dname = 'RESEARCH')
 and  ( d.loc = 'DALLAS');

3) ����

select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  ( d.dname = ( select d.dname 
                    from emp e, dept d
                    where (e.deptno = d.deptno)
                     and  ( e.ename = 'SMITH') ))
 and  ( d.loc = ( select d.loc
                from emp e, dept d
                where (e.deptno = d.deptno)
                 and  ( e.ename = 'SMITH') ));
--------------------
2) ���� �μ�, ���� ��ġ���� �ٹ��ϴ� �������� �̸�, ���, �μ���, ��ġ�� ?

 select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  (d.dname, d.loc) in (('RESEARCH', 'DALLAS'));
3) ����

 select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  (d.dname, d.loc) in ( select d.dname, d.loc
                            from emp e, dept d
                            where (e.deptno = d.deptno)
                             and  ( e.ename = 'SMITH' ));
 
 
-----------------------------------
�������� Ŀ�̼� ����� ?
select 
 (select sum(comm) from emp)/(select count(comm) from emp where (comm > 0))
from dual;
-----------------------------------

[ �������� ]
martin ������ ���� ���� �Ҽ� �������� ��ձ޿�����
���� �޴� �������� 
�̸�, ����, �μ���, �޿�, �޿����, ����̸�, ����μ�����?

1) martin ���� ?

select job
from emp 
where ( ename = 'MARTIN');

2) SALESMAN ���� �Ҽ� �������� ��ձ޿� ?

select avg(sal)
from emp 
where job = 'SALESMAN';

3) 1400 ���� ���� �޴� �������� �̸�, ����, �μ���, �޿�, �޿����, ����̸�, ����μ�����?

select ee.ename, ee.job, ed.dname, ee.sal, es.grade, me.ename, md.dname
from emp ee, dept ed, salgrade es, emp me, dept md
where ( ee.deptno = ed.deptno )
 and  ( ee.sal between es.losal and es.hisal )
 and  ( ee.mgr = me.empno )
 and  ( me.deptno = md.deptno )
 and  ( ee.sal < 1400 );

4) �� ��
select ee.ename, ee.job, ed.dname, ee.sal, es.grade, me.ename, md.dname
from emp ee, dept ed, salgrade es, emp me, dept md
where ( ee.deptno = ed.deptno )
 and  ( ee.sal between es.losal and es.hisal )
 and  ( ee.mgr = me.empno )
 and  ( me.deptno = md.deptno )
 and  ( ee.sal <  ( select avg(sal)
                    from emp 
                    where job = ( select job
                                    from emp 
                                    where ( ename = 'MARTIN')) ) );










