-- 02_scott.sql

-- ������ ã�ƺ�����
-- SMITH�� �μ��� : RESEARCH
select dept.deptno, dept.dname
from emp, dept
where emp.deptno = dept.deptno and  emp.ename = 'SMITH';

-- RESEARCH �μ� �Ҽ����� �̸���?
select emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno 
and dept.dname = 'RESEARCH';

-- CLERK ������ �ϴ� ���� �� �̸�, ���, �μ���, �μ���ġ��?
select emp.ename, emp.empno, dept.dname, dept.loc
from emp, dept
where emp.deptno = dept.deptno 
and emp.job = 'CLERK';

-- DALLAS���� ���ϴ� �������� �μ���, �μ���ġ, �μ���ȣ, �̸�, ���?
select d.dname, d.loc, d.deptno, e.ename, e.empno
from emp e, dept d
where e.deptno = d.deptno
and d.loc = 'DALLAS';

-- A�ڷ� �����ϴ� �̸��� ���� �������� �̸� ��� �μ���
select e.ename, e.empno, d.dname
from emp e, dept d
where e.deptno = d.deptno
and e.ename like 'A%';

-- �޿��� 2000�̻��� �������� �̸� �μ��� �޿� ��ġ
select e.ename, d.dname, e.sal, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.sal >= 2000;

-- �޿��� 1500 ~ 2500 ������ �������� �̸� �μ��� �޿�
select e.ename, d.dname, e.sal
from emp e, dept d
where e.deptno = d.deptno
and sal between 1500 and 2500;

-- 1�� ������ 20000�̻��� �������� �̸�, �μ���, 1�� ���Աݾ�
select e.ename, d.dname, (e.sal * 12 + nvl(e.comm, 0)) as "1�� ���Աݾ�"
from emp e, dept d
where e.deptno = d.deptno
and (e.sal * 12 + nvl(e.comm, 0)) >= 20000;

-- �μ��� ��� �޿��� 2000�� �Ѵ� �μ��� ��ձ޿�
select d.dname, trunc(avg(e.sal))
from emp e, dept d
where d.deptno = e.deptno
group by d.dname
having avg(e.sal) > 2000;


---------------------------------------------------------

-- ���̽��� �޿������?
select e.ename, sg.grade
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
and e.ename = 'SMITH';

-- 3����� �޿������ ������ �ִ� �������� �̸�, �޿�, �޿������?
select e.ename, e.sal, sg.grade
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
and sg.grade = 3;

-- �޿���޺� ��������?
select sg.grade, count(e.empno)
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
group by sg.grade;

-- �޿���޺� �������� 3�� �̻��� �޿���ް� ��������?
select sg.grade, count(e.empno)
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
group by sg.grade
having count(e.empno) >= 3;

-- �޿������ 3����� �������� �޿����, �̸�, ���, �μ���
select s.grade, e.ename, e.empno, d.dname
from salgrade s, emp e, dept d
where (e.deptno = d.deptno)
and (e.sal between s.losal and s.hisal)
and s.grade = 3;

-- ��ī�� �ٹ��ϴ� �������� �̸� �μ��� ��ġ �޿� �޿����
select e.ename, d.dname, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where (e.deptno = d.deptno)
and (e.sal between s.losal and s.hisal)
and d.loc = 'CHICAGO';

-- SMITH�� ���ӻ�� �̸���?
select ee.ename, me.ename
from emp me, emp ee
where ee.mgr = me.empno
and ee.ename = 'SMITH';

-- KING�� �̸�, ����� ���������� �̸� ���
select me.ename, me.empno, ee.ename, ee.empno
from emp me, emp ee
where ee.mgr = me.empno
and me.ename = 'KING';

-- 1��� �޿������ ���� �������� �̸�, �޿�, �޿����, ���ӻ���̸�
select ee.ename, ee.sal, s.grade, me.ename
from salgrade s, emp ee, emp me
where ee.sal between s.losal and s.hisal
and me.empno = ee.mgr
and s.grade = 1;

-- SALES �μ��� �μ���, �Ҽ� �����̸�, ���, �޿�, �޿����, ���ӻ���̸�, ������?
select d.dname, ee.ename, ee.empno, ee.sal, s.grade, me.ename, me.empno
from dept d, emp me, emp ee, salgrade s
where d.deptno = ee.deptno
and ee.sal between s.losal and s.hisal
and me.empno = ee.mgr
and d.dname = 'SALES';

-- KING�� �̸� job �μ���� ���� ������������ �̸�, job, �μ���?
select me.ename, me.job, md.dname, ee.ename, ee.job, de.dname
from emp me, dept md, emp ee, dept de
where me.deptno = md.deptno
and me.empno = ee.mgr
and ee.deptno = de.deptno
and me.ename = 'KING';

select me.ename, me.job, md.dname, ee.ename, ee.job, de.dname
from emp me, dept md, emp ee, dept de
where me.deptno = md.deptno
and me.empno = ee.mgr
and ee.deptno = de.deptno
and me.ename = 'KING';

-- BLAKE�� �̸�, ���, �޿�, �޿����, �μ���, ����� �̸�, ���, �μ�����?
select ee.ename, ee.empno, ee.sal, se.grade, ed.dname ,me.ename, me.empno, md.dname
from emp ee, emp me, dept md, dept ed, salgrade se
where ee.deptno = ed.deptno
and ee.sal between se.losal and se.hisal
and me.deptno = md.deptno
and me.empno = ee.mgr
and ee.ename = 'BLAKE'; 

-- KING�� �̸�, job, �޿�, �޿����, �μ���� ���� ������������ �̸�, job, �޿�, �޿����, �μ�����?
select me.ename, me.job, me.sal, ms.grade, md.dname , ee.ename, ee.job, ee.sal, es.grade, ed.dname
from emp ee, emp me, dept md, dept ed, salgrade es, salgrade ms
where ee.deptno = ed.deptno
and ee.sal between es.losal and es.hisal
and me.deptno = md.deptno
and me.sal between ms.losal and ms.hisal
and me.empno = ee.mgr
and me.ename = 'KING';


------------------------------------------------------------
create table dept2
as
select * from dept;

create table emp2
as
select ename, empno, deptno from emp
where (ename like '%ER') or (ename like '%ES');

insert into emp2 values('SSG', 9999, null);
-------------------------------------------------------------

select * from emp2;
select * from dept2;

select *
from emp2 e,  dept2 d
where (e.deptno = d.deptno(+));

select *
from emp2 e,  dept2 d
where (e.deptno(+) = d.deptno) ;
-- (+) : �ش� ���̺� ���� �ٸ� �� ���� ǥ���϶�

select *
from emp2 e full outer join dept2 d on (e.deptno = d.deptno);


-- JAMES ã�� (ANSI ��Ÿ��)
select *
from emp2 join dept2 
on (emp2.deptno = dept2.deptno)
where emp2.ename = 'JAMES';

-- join�� �÷����� ������ using ��� ����
select *
from emp2 inner join dept2 
using (deptno)
where emp2.ename = 'JAMES';

select *
from emp2 natural join dept2 
where emp2.ename = 'JAMES';

select *
from emp2 cross join dept2 
where emp2.ename = 'JAMES';

-- ���̽��� �޿����? (ANSI)
select salgrade.grade
from emp join salgrade
on emp.sal between salgrade.losal and salgrade.hisal
where emp.ename = 'SMITH';

-- 3�޿� ����� �������� �̸�, �޿�, �μ���? (ANSI)
select e.ename, e.sal, s.grade, d.dname
from salgrade s join emp e on (s.losal <= e.sal and e.sal <= s.hisal)
                join dept d on e.deptno = d.deptno
where s.grade = 3;

-- KING�� �̸�, job, �μ���� ������������ �̸�, job, �μ��� (ANSI)
select me.ename, me.job, md.dname, ee.ename, ee.job, ed.dname
from emp ee join emp me on (ee.mgr = me.empno)
            join dept ed on ee.deptno = ed.deptno
            join dept md on me.deptno = md.deptno
where me.ename = 'KING';

-- KING�� �̸�, job�� ������������ �̸�, job, �޿� �޿����, �μ���?
select me.ename, me.job, ee.ename, ee.job, ee.sal, es.grade, ed.dname
from emp ee join salgrade es on ee.sal between es.losal and es.hisal
            join emp me on (ee.mgr = me.empno)
            join dept ed on ee.deptno = ed.deptno
where me.ename = 'KING';


select *
from emp2 e, dept2 d
where e.deptno = d.deptno(+);

select *
from emp2 e left outer join dept2 d using(deptno);

select *
from emp2 e right outer join dept2 d using(deptno);

select *
from emp2 e full outer join dept2 d using(deptno);


-- �μ��� �ο�����? (��, ��� �μ��� �� ���;���)
select d.dname, count(e.empno)
from emp e, dept d 
where e.deptno(+) = d.deptno
group by d.dname;


select d.dname, count(e.empno)
from emp e right join dept d on e.deptno = d.deptno
group by d.dname;

-- �μ��� �޿��հ��? (��, ��� �μ��� �� ���;� ��)
select d.dname, sum(nvl(e.sal, 0))
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.dname;

select d.dname, sum(nvl(e.sal, 0))
from emp e right join dept d on e.deptno = d.deptno
group by d.dname;

-- �μ��� �޿��հ谡 8000������ �μ���� �޿��հ��? (��, ��� �μ��� �� ���;� ��)
select d.dname, sum(nvl(e.sal, 0))
from emp e, dept d 
where e.deptno(+) = d.deptno
group by d.dname
having sum(nvl(e.sal, 0)) <= 8000 ;

select d.dname, sum(nvl(e.sal, 0))
from emp e right join dept d on e.deptno = d.deptno
group by d.dname
having sum(nvl(e.sal, 0)) <= 8000 ;

-----------------------------------------
-- MARTIN�� ���� �޿��� �޴� �������� �̸�, �޿���?
---- 1) MARTIN�� ���� �޿�?
select sal 
from emp
where ename = 'MARTIN';
---- 2) �� �޿��� �޴� �������� �̸�, �޿�?
select ename, sal
from emp
where sal = 1250;
---- 3) ����
select ename, sal
from emp
where sal = (select sal 
                from emp
                where ename = 'MARTIN');

-- �������� ��� �޿����� �޿��� ���� �޴� �������� �̸�, ��� �޿�
select ename, empno, sal
from emp
where sal > (select avg(sal) from emp);

-- sales�μ��� �μ� ��ձ޿����� �޿��� ���� �޴� �������� �̸�, �޿�, �޿����, �μ���
select e.ename, e.sal, s.grade, d.dname
from emp e, dept d, salgrade s
where (e.deptno = d.deptno) and (e.sal between s.losal and s.hisal)
and e.sal > (select avg(e.sal)
            from emp e, dept d
            where e.deptno = d.deptno and d.dname = 'SALES'
             );


-- SALESMAN ����(JOB)�� �ϴ� �������� �޿����� �޿��� ���� �޴� �������� �̸�, �޿�, ����(JOB)��?
--> all, any
--> any > : �ּҰ��̶� ��
select ename, sal, job
from emp
where sal > any (select sal from emp where job = 'SALESMAN');

--> all > : �ִ밪�̶� ��
select ename, sal, job
from emp
where sal > all (select sal from emp where job = 'SALESMAN');

--> any < : �ִ밪�̶� ��
select ename, sal, job
from emp
where sal < any (select sal from emp where job = 'SALESMAN');

--> all < : �ּҰ��̶� ��
select ename, sal, job
from emp
where sal < all (select sal from emp where job = 'SALESMAN');


-- research �μ�, dallas ��ġ���� �ٹ��ϴ� �������� �̸�, ���, �μ���, ��ġ��?
select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and e.deptno in (select deptno from dept where dname = 'RESEARCH' and loc = 'DALLAS');

select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and (d.dname = 'RESEARCH')
and (d.loc = 'DALLAS');

--> tuple ���·ε� ����
select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and ((d.dname, d.loc) in (('RESEARCH', 'DALLAS')));

--> tuple ���·ε� ����, �� �ϳ��϶��� in ��� = ����
select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and ((d.dname, d.loc) = (('RESEARCH', 'DALLAS')));


-- SMITH�� ���� �μ�, ���� ��ġ���� �ٹ��ϴ� �������� �̸�, ���, �μ���, ��ġ��?
select e.ename, e.empno, d.dname, d.loc
from emp e, (select d.deptno, d.dname, d.loc 
                from emp e, dept d 
                where e.deptno = d.deptno
                and e.ename = 'SMITH'
            ) d
where (e.deptno = d.deptno);

select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and (d.dname, d.loc) in (select d.dname, d.loc 
                            from emp e, dept d 
                            where e.deptno = d.deptno
                            and e.ename = 'SMITH');

---------------------------------------------------
-- �������� Ŀ�̼� ���?
select 
    (select sum(comm) from emp) / (select count(comm) from emp where comm > 0)
from dual;

-- MARTIN ������ ���� ���� �Ҽ� ������ ��� �޿����� ���Թ޴� �������� �̸�, ����, �μ���, �޿�, �޾ߵ��, ����̸�, ����μ���?
--> �߸�Ǯ����;
select ee.ename, ee.job, ed.deptno, ee.sal, es.grade, me.ename, md.dname 
from emp ee, dept ed, salgrade es, emp me, dept md
where ee.deptno = ed.deptno
and   ee.sal between es.losal and es.hisal
and   ee.mgr = me.empno
and   me.deptno = md.deptno
and   ee.sal < (select avg(e.sal) 
                from emp e, dept d
                where e.deptno = d.deptno
                and d.dname in (select d.dname
                                    from emp e, dept d 
                                    where e.deptno = d.deptno 
                                    and e.ename = 'MARTIN')  );
           
select avg(e.sal) 
from emp e, dept d
where e.deptno = d.deptno
and d.dname in (select d.dname
                from emp e, dept d 
                where e.deptno = d.deptno 
                and e.ename = 'MARTIN');                

select d.dname
from emp e, dept d 
where e.deptno = d.deptno 
and e.ename = 'MARTIN';
------

select job from emp where ename = 'MARTIN';

select avg(sal)
from emp
where job = (select job from emp where ename = 'MARTIN');


select ee.ename, ee.job, ed.deptno, ee.sal, es.grade, me.ename, md.dname 
from emp ee, dept ed, salgrade es, emp me, dept md
where ee.deptno = ed.deptno
and   ee.sal between es.losal and es.hisal
and   ee.mgr = me.empno
and   me.deptno = md.deptno
and   ee.sal < (select avg(sal)
                from emp
                where job = (select job 
                            from emp 
                            where ename = 'MARTIN'));