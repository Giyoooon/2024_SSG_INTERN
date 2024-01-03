-- 02_scott.sql 

--> 눈으로 찾아보세요 (^*^)

스미스의 부서명은 ?

select dname
from emp, dept
-- where ( 20 = 20 )
where ( emp.deptno = dept.deptno )
 and  (ename = 'SMITH');

RESEARCH 부서 소속직원들의 이름은 ?

select ename
from dept, emp
where ( dept.deptno = emp.deptno )
 and ( dname = 'RESEARCH');

CLERK 업무를 하는 직원들의 이름, 사번, 부서명, 부서위치는?

select ename, empno, dname, loc 
from emp, dept
where ( dept.deptno = emp.deptno )
 and ( job = 'CLERK' );


-------------------------------------
DALLAS 에서 일하는 직원들의 부서명, 부서번호, 부서위치, 이름, 사번은? 

select d.dname, d.deptno, d.loc, e.ename, e.empno
from dept d, emp e
where ( d.deptno = e.deptno)
 and  ( d.loc = 'DALLAS' );


A자로 시작하는 이름을 가진 직원들의 이름, 사번, 부서명은?

select e.ename, e.empno, d.dname
from emp e, dept d
where  ( e.deptno = d.deptno )
 and  ( e.ename like 'A%' );

급여가 2000 이상인 직원들의 이름, 부서명, 급여, 위치는?

select e.ename, d.dname, e.sal, d.loc
from emp e, dept d
where ( e.deptno = d.deptno )
 and  ( e.sal >= 2000 );

급여가 1500 ~ 2500 사이인 직원들의 이름, 부서명, 급여는?

select e.ename, d.dname, e.sal
from emp e, dept d
where ( e.deptno = d.deptno )
 and  ( e.sal between 1500 and 2500 );

1년 수입이 20000 이 넘는 직원들의 이름, 부서명, 1년 수입금액은?

select e.ename, d.dname, ((e.sal*12) + nvl(comm,0)) "1년 수입금액"
from emp e, dept d
where ( e.deptno = d.deptno )
 and ( ((e.sal*12) + nvl(comm,0)) > 20000);

부서명별 평균 급여가 2000이 넘는 부서와 평균급여는?

select d.dname, avg(e.sal)
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname
having ( avg(e.sal) > 2000);

--------------------------------------------------

--> 눈으로 찾아보세요 (^*^)

스미스의 급여등급은 ?

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
3등급의 급여등급을 가지고 있는 직원들의 이름, 급여, 급여등급은?

select e.ename, e.sal, s.grade
from salgrade s, emp e
where ( e.sal between s.losal and s.hisal )
 and  ( s.grade = 3 );

급여등급별 직원수는 ?

select s.grade,count(e.empno)
from salgrade s, emp e
where ( e.sal between s.losal and s.hisal )
group by s.grade;


급여등급별 직원수가 3명 이상인 급여등급과 직원수는 ?

select s.grade,count(e.empno)
from salgrade s, emp e
where ( e.sal between s.losal and s.hisal )
group by s.grade
having (count(e.empno) >= 3);

-----------------------------------------------------------------
급여등급이 3등급인 직원들의 급여등급, 이름, 사번, 부서명은?

select s.grade , e.ename, e.empno, d.dname
from salgrade s, emp e, dept d
where ( e.sal between s.losal and s.hisal )
 and  ( d.deptno = e.deptno )
 and  ( s.grade = 3 );

시카고에 근무하는 직원들의 이름, 부서명, 위치, 급여, 급여등급은?

select e.ename, d.dname, d.loc, e.sal, s.grade
from dept d, emp e, salgrade s
where ( d.deptno = e.deptno )
 and  ( e.sal between s.losal and s.hisal )
 and  ( d.loc = 'CHICAGO');

--------------------------------------------------

--> 눈으로 찾아보세요 (^*^)

 SMITH의 직속상관 이름은 ?;
 
select ee.ename, me.ename
from emp ee, emp me
where ( ee.mgr = me.empno)
 and  ( ee.ename = 'SMITH');
 
KING의 이름, 사번 그리고, 그를 직속상관으로 둔 부하직원의 이름과 사번은?

select me.ename, me.empno, ee.ename, ee.empno
from emp me, emp ee
where ( me.empno = ee.mgr )
 and  ( me.ename = 'KING' );

-----------------------------------------------------------
1등급 급여등급을 가진 직원들의 이름, 급여,급여등급, 직속상관이름은?

select ee.ename, ee.sal, es.grade, me.ename
from salgrade es, emp ee, emp me
where ( ee.sal between es.losal and es.hisal )
 and ( ee.mgr = me.empno )
 and ( es.grade = 1 );

SALES 부서의 부서명, 소속 직원이름, 사번, 급여, 급여등급, 직속상관이름, 상관사번은?

select ed.dname, ee.ename, ee.empno, ee.sal, es.grade, me.ename, me.empno
from dept ed, emp ee, salgrade es, emp me
where ( ed.deptno = ee.deptno )
 and  ( ee.sal between es.losal and es.hisal )
 and  ( ee.mgr = me.empno )
 and  ( ed.dname = 'SALES' );
 
King의 이름, job, 부서명과 
그의 부하직원들의 이름,  job, 부서명은?

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
BLAKE의 이름, 사번, 급여, 급여등급, 부서명, 상관의 이름, 사번, 부서명은?

select ee.ename, ee.empno, ee.sal, es.grade, ed.dname, me.ename, me.empno, md.dname
from emp ee, salgrade es, dept ed, emp me, dept md
where ( ee.sal between es.losal and es.hisal )
 and  ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno )
 and  ( me.deptno = md.deptno )
 and  ( ee.ename = 'BLAKE' );

King의 이름, job, 급여, 급여등급, 부서명과 
그의 부하직원들의 이름,  job, 급여, 급여등급,부서명은?

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

제임스의 이름과 부서명은 ?

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

스미스의 급여등급은?

select e.ename, s.grade
from emp e inner join salgrade s on ( e.sal between s.losal and s.hisal )
where ( e.ename = 'SMITH' );


3급여등급의 직원들 이름, 급여, 부서명은?

select e.ename, e.sal, s.grade, d.dname 
from salgrade s join emp e on ( e.sal between s.losal and s.hisal )
                join dept d on ( e.deptno = d.deptno )
where ( s.grade = 3 );

KING의 이름, job, 부서명과 부하직원들의 이름, job, 부서명은?

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


KING의 이름, job과 부하직원들의 이름, job, 급여, 급여등급, 부서명은 ?

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
 
부서명별 인원수는 ? 
(단, 모든 부서가 다 나와야 함);

select d.dname, count(e.empno)
from dept d, emp e
where (d.deptno = e.deptno(+))
group by d.dname;

select d.dname, count(e.empno)
from dept d left outer join emp e on (d.deptno = e.deptno(+))
group by d.dname;

부서명별 급여합계는 ? 
(단, 모든 부서가 다 나와야 함);

select d.dname, sum(e.sal)
from dept d, emp e
where (d.deptno = e.deptno(+))
group by d.dname;

select d.dname, sum(e.sal)
from dept d left outer join emp e on (d.deptno = e.deptno(+))
group by d.dname;

부서명별 급여합계가 8000 이하인 부서명과 급여합계는 ? 
(단, 모든 부서가 다 나와야 함);

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
MARTIN 과 같은 급여를 받는 직원들의 이름, 급여는?

1) MARTIN 과 같은 급여 ?

select sal
from emp 
where (ename = 'MARTIN');

2) 1250 급여를 받는 직원들의 이름, 급여는?

select ename, sal
from emp
where ( sal = 1250);

3) 결 합

select ename, sal
from emp
where ( sal = ( select sal
                from emp 
                where (ename = 'MARTIN') ));

--------------------------------------
-- [ 참고만 할 것 ] --
--MARTIN 과 같은 급여를 받는 직원들의 이름, 급여는?

--select e2.ename, e2.sal
--from emp e1, emp e2
--where ( e1.sal = e2.sal )
-- and  ( e1.ename = 'MARTIN');

-----------------------------------------
전직원의 평균급여보다 급여를 많이 받는 직원들의 이름, 사번, 급여는?  

1) 전직원의 평균급여

select avg(sal)
from emp;

2) 2077 보다 급여를 많이 받는 직원들의 이름, 사번, 급여는?  

select ename, empno, sal
from emp
where ( sal  > 2077 );


3) 결 합

select ename, empno, sal
from emp
where ( sal  > (select avg(sal)
                from emp ) );

-------------------------------
sales부서의 부서 평균급여보다 급여를 많이 받는 
 직원들의 이름, 급여, 급여등급, 부서명은? 

1) sales부서의 부서 평균급여 ?

select avg(e.sal)
from dept d, emp e
where ( d.deptno = e.deptno )
 and ( d.dname ='SALES');
 
2) 1566 급여보다 급여를 많이 받는 직원들의 이름, 급여, 급여등급, 부서명은? 

select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where ( e.sal between s.losal and s.hisal)
 and  ( e.deptno = d.deptno )
 and  ( e.sal > 1566);

3) 결 합
select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where ( e.sal between s.losal and s.hisal)
 and  ( e.deptno = d.deptno )
 and  ( e.sal >  ( select avg(e.sal)
                    from dept d, emp e
                    where ( d.deptno = e.deptno )
                     and ( d.dname ='SALES') ) );
 
-----------------------------------------
SALESMAN 업무(JOB)를 하는 직원들의 급여보다 
급여를 많이 받는 직원들의 이름, 급여, 업무(JOB)은 ?

1) SALESMAN 업무(JOB)를 하는 직원들의 급여 ?

select sal
from emp 
where (job = 'SALESMAN');

2) 1600 급여보다 급여를 많이 받는 직원들의 이름, 급여, 업무(JOB)은 ?

select ename, sal, job
from emp 
where ( sal > 1600 );

3) 결 합 
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
RESEARCH 부서, DALLAS 위치에서 근무하는 직원들의 이름, 사번, 부서명, 위치는 ?

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
 
SMITH와 같은 부서, 같은 위치에서 근무하는 직원들의 이름, 사번, 부서명, 위치는 ?

1) SMITH와 같은 부서, 같은 위치 ?

select d.dname, d.loc
from emp e, dept d
where (e.deptno = d.deptno)
 and  ( e.ename = 'SMITH');

2) 같은 부서, 같은 위치에서 근무하는 직원들의 이름, 사번, 부서명, 위치는 ?

select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  ( d.dname = 'RESEARCH')
 and  ( d.loc = 'DALLAS');

3) 결합

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
2) 같은 부서, 같은 위치에서 근무하는 직원들의 이름, 사번, 부서명, 위치는 ?

 select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  (d.dname, d.loc) in (('RESEARCH', 'DALLAS'));
3) 결합

 select e.ename, e.empno, d.dname, d.loc
from dept d, emp e
where ( d.deptno = e.deptno )
 and  (d.dname, d.loc) in ( select d.dname, d.loc
                            from emp e, dept d
                            where (e.deptno = d.deptno)
                             and  ( e.ename = 'SMITH' ));
 
 
-----------------------------------
직원들의 커미션 평균은 ?
select 
 (select sum(comm) from emp)/(select count(comm) from emp where (comm > 0))
from dual;
-----------------------------------

[ 최종문제 ]
martin 직원과 같은 업무 소속 직원들의 평균급여보다
적게 받는 직원들의 
이름, 업무, 부서명, 급여, 급여등급, 상관이름, 상관부서명은?

1) martin 업무 ?

select job
from emp 
where ( ename = 'MARTIN');

2) SALESMAN 업무 소속 직원들의 평균급여 ?

select avg(sal)
from emp 
where job = 'SALESMAN';

3) 1400 보다 적게 받는 직원들의 이름, 업무, 부서명, 급여, 급여등급, 상관이름, 상관부서명은?

select ee.ename, ee.job, ed.dname, ee.sal, es.grade, me.ename, md.dname
from emp ee, dept ed, salgrade es, emp me, dept md
where ( ee.deptno = ed.deptno )
 and  ( ee.sal between es.losal and es.hisal )
 and  ( ee.mgr = me.empno )
 and  ( me.deptno = md.deptno )
 and  ( ee.sal < 1400 );

4) 결 합
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










