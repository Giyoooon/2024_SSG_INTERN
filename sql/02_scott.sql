-- 02_scott.sql

-- 눈으로 찾아보세요
-- SMITH의 부서명 : RESEARCH
select dept.deptno, dept.dname
from emp, dept
where emp.deptno = dept.deptno and  emp.ename = 'SMITH';

-- RESEARCH 부서 소속직원 이름은?
select emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno 
and dept.dname = 'RESEARCH';

-- CLERK 업무를 하는 직원 의 이름, 사번, 부서명, 부서위치는?
select emp.ename, emp.empno, dept.dname, dept.loc
from emp, dept
where emp.deptno = dept.deptno 
and emp.job = 'CLERK';

-- DALLAS에서 일하는 직원들의 부서명, 부서위치, 부서번호, 이름, 사번?
select d.dname, d.loc, d.deptno, e.ename, e.empno
from emp e, dept d
where e.deptno = d.deptno
and d.loc = 'DALLAS';

-- A자로 시작하는 이름을 가진 직원들의 이름 사번 부서명
select e.ename, e.empno, d.dname
from emp e, dept d
where e.deptno = d.deptno
and e.ename like 'A%';

-- 급여가 2000이상인 직원들의 이름 부서명 급여 위치
select e.ename, d.dname, e.sal, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.sal >= 2000;

-- 급여가 1500 ~ 2500 사이인 직원들의 이름 부서명 급여
select e.ename, d.dname, e.sal
from emp e, dept d
where e.deptno = d.deptno
and sal between 1500 and 2500;

-- 1년 수입이 20000이상인 직원들의 이름, 부서명, 1년 수입금액
select e.ename, d.dname, (e.sal * 12 + nvl(e.comm, 0)) as "1년 수입금액"
from emp e, dept d
where e.deptno = d.deptno
and (e.sal * 12 + nvl(e.comm, 0)) >= 20000;

-- 부서명별 평균 급여가 2000이 넘는 부서와 평균급여
select d.dname, trunc(avg(e.sal))
from emp e, dept d
where d.deptno = e.deptno
group by d.dname
having avg(e.sal) > 2000;


---------------------------------------------------------

-- 스미스의 급여등급은?
select e.ename, sg.grade
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
and e.ename = 'SMITH';

-- 3등급의 급여등급을 가지고 있는 직원들의 이름, 급여, 급여등급은?
select e.ename, e.sal, sg.grade
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
and sg.grade = 3;

-- 급여등급별 직원수는?
select sg.grade, count(e.empno)
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
group by sg.grade;

-- 급여등급별 직원수가 3명 이상인 급여등급과 직원수는?
select sg.grade, count(e.empno)
from emp e, salgrade sg
where e.sal between sg.losal and sg.hisal
group by sg.grade
having count(e.empno) >= 3;

-- 급여등급이 3등급인 직원들의 급여등급, 이름, 사번, 부서명
select s.grade, e.ename, e.empno, d.dname
from salgrade s, emp e, dept d
where (e.deptno = d.deptno)
and (e.sal between s.losal and s.hisal)
and s.grade = 3;

-- 시카고에 근무하는 직원들의 이름 부서명 위치 급여 급여등급
select e.ename, d.dname, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where (e.deptno = d.deptno)
and (e.sal between s.losal and s.hisal)
and d.loc = 'CHICAGO';

-- SMITH의 직속상관 이름은?
select ee.ename, me.ename
from emp me, emp ee
where ee.mgr = me.empno
and ee.ename = 'SMITH';

-- KING의 이름, 사번과 부하직원의 이름 사번
select me.ename, me.empno, ee.ename, ee.empno
from emp me, emp ee
where ee.mgr = me.empno
and me.ename = 'KING';

-- 1등급 급여등급을 가진 직원들의 이름, 급여, 급여등급, 직속상관이름
select ee.ename, ee.sal, s.grade, me.ename
from salgrade s, emp ee, emp me
where ee.sal between s.losal and s.hisal
and me.empno = ee.mgr
and s.grade = 1;

-- SALES 부서의 부서명, 소속 직원이름, 사번, 급여, 급여등급, 직속상관이름, 상관사번?
select d.dname, ee.ename, ee.empno, ee.sal, s.grade, me.ename, me.empno
from dept d, emp me, emp ee, salgrade s
where d.deptno = ee.deptno
and ee.sal between s.losal and s.hisal
and me.empno = ee.mgr
and d.dname = 'SALES';

-- KING의 이름 job 부서명과 그의 부하직원들의 이름, job, 부서명?
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

-- BLAKE의 이름, 사번, 급여, 급여등급, 부서명, 상관의 이름, 사번, 부서명은?
select ee.ename, ee.empno, ee.sal, se.grade, ed.dname ,me.ename, me.empno, md.dname
from emp ee, emp me, dept md, dept ed, salgrade se
where ee.deptno = ed.deptno
and ee.sal between se.losal and se.hisal
and me.deptno = md.deptno
and me.empno = ee.mgr
and ee.ename = 'BLAKE'; 

-- KING의 이름, job, 급여, 급여등급, 부서명과 그의 부하직원들의 이름, job, 급여, 급여등급, 부서명은?
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
-- (+) : 해당 테이블에 없는 다른 행 까지 표현하라

select *
from emp2 e full outer join dept2 d on (e.deptno = d.deptno);


-- JAMES 찾기 (ANSI 스타일)
select *
from emp2 join dept2 
on (emp2.deptno = dept2.deptno)
where emp2.ename = 'JAMES';

-- join할 컬럼명이 같을때 using 사용 가능
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

-- 스미스의 급여등급? (ANSI)
select salgrade.grade
from emp join salgrade
on emp.sal between salgrade.losal and salgrade.hisal
where emp.ename = 'SMITH';

-- 3급여 등급의 직원들의 이름, 급여, 부서명? (ANSI)
select e.ename, e.sal, s.grade, d.dname
from salgrade s join emp e on (s.losal <= e.sal and e.sal <= s.hisal)
                join dept d on e.deptno = d.deptno
where s.grade = 3;

-- KING의 이름, job, 부서명과 부하직원들의 이름, job, 부서명 (ANSI)
select me.ename, me.job, md.dname, ee.ename, ee.job, ed.dname
from emp ee join emp me on (ee.mgr = me.empno)
            join dept ed on ee.deptno = ed.deptno
            join dept md on me.deptno = md.deptno
where me.ename = 'KING';

-- KING의 이름, job과 부하직원들의 이름, job, 급여 급여등급, 부서명?
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


-- 부서명별 인원수는? (단, 모든 부서가 다 나와야함)
select d.dname, count(e.empno)
from emp e, dept d 
where e.deptno(+) = d.deptno
group by d.dname;


select d.dname, count(e.empno)
from emp e right join dept d on e.deptno = d.deptno
group by d.dname;

-- 부서명별 급여합계는? (단, 모든 부서가 다 나와야 함)
select d.dname, sum(nvl(e.sal, 0))
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.dname;

select d.dname, sum(nvl(e.sal, 0))
from emp e right join dept d on e.deptno = d.deptno
group by d.dname;

-- 부서명별 급여합계가 8000이하인 부서명과 급여합계는? (단, 모든 부서가 다 나와야 함)
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
-- MARTIN과 같은 급여를 받는 직원들의 이름, 급여는?
---- 1) MARTIN과 같은 급여?
select sal 
from emp
where ename = 'MARTIN';
---- 2) 그 급여를 받는 직원들의 이름, 급여?
select ename, sal
from emp
where sal = 1250;
---- 3) 결합
select ename, sal
from emp
where sal = (select sal 
                from emp
                where ename = 'MARTIN');

-- 전직원의 평균 급여보다 급여를 많이 받는 직원들의 이름, 사번 급여
select ename, empno, sal
from emp
where sal > (select avg(sal) from emp);

-- sales부서의 부서 평균급여보다 급여를 많이 받는 직원들의 이름, 급여, 급여등급, 부서명
select e.ename, e.sal, s.grade, d.dname
from emp e, dept d, salgrade s
where (e.deptno = d.deptno) and (e.sal between s.losal and s.hisal)
and e.sal > (select avg(e.sal)
            from emp e, dept d
            where e.deptno = d.deptno and d.dname = 'SALES'
             );


-- SALESMAN 업무(JOB)를 하는 직원들의 급여보다 급여를 많이 받는 직원들의 이름, 급여, 업무(JOB)은?
--> all, any
--> any > : 최소값이랑 비교
select ename, sal, job
from emp
where sal > any (select sal from emp where job = 'SALESMAN');

--> all > : 최대값이랑 비교
select ename, sal, job
from emp
where sal > all (select sal from emp where job = 'SALESMAN');

--> any < : 최대값이랑 비교
select ename, sal, job
from emp
where sal < any (select sal from emp where job = 'SALESMAN');

--> all < : 최소값이랑 비교
select ename, sal, job
from emp
where sal < all (select sal from emp where job = 'SALESMAN');


-- research 부서, dallas 위치에서 근무하는 직원들의 이름, 사번, 부서명, 위치는?
select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and e.deptno in (select deptno from dept where dname = 'RESEARCH' and loc = 'DALLAS');

select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and (d.dname = 'RESEARCH')
and (d.loc = 'DALLAS');

--> tuple 형태로도 가능
select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and ((d.dname, d.loc) in (('RESEARCH', 'DALLAS')));

--> tuple 형태로도 가능, 단 하나일때는 in 대신 = 가능
select e.ename, e.empno, d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
and ((d.dname, d.loc) = (('RESEARCH', 'DALLAS')));


-- SMITH와 같은 부서, 같은 위치에서 근무하는 직원들의 이름, 사번, 부서명, 위치는?
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
-- 직원들의 커미션 평균?
select 
    (select sum(comm) from emp) / (select count(comm) from emp where comm > 0)
from dual;

-- MARTIN 직원과 같은 업무 소속 직원의 평균 급여보다 적게받는 직원들의 이름, 업무, 부서명, 급여, 급야등급, 상관이름, 상관부서명?
--> 잘못풀었다;
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