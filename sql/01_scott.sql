-- 01_scott.sql

select * from emp;

-- 직원들의 이름, 사번, 급여는?
select ename, empno, sal
from emp;

-- 직원들의 이름, 사번, 상관의 사번, 부서 번호는?
select ename, empno, mgr, deptno
from emp;

-- 부서들의 이름, 위치는?
select dname, loc
from dept;

select 10 + 20, 10 - 20, 10 / 20, 10 * 20 
from dual;

select 'shinsegae' || ' inc'
from dual;

-- SMITH의 급여는 800 입니다
select ename || '의 급여는 ' || sal || '입니다.'
from emp;


-- SMITH의 10% 인상된 급여는 880입니다.
select ename || '의 10% 인상된 급여는 ' || sal*1.1 || '입니다.'
from emp;

-- 직원들의 이름, 사번, 업무, 급여, 연봉은? 단 연봉은 12개월치 급여입니다
select ename as "이름", 
        empno as "사번", 
        job as 업무, 
        sal "급여", 
        sal * 12 as "연 봉"
from emp;

-- 직원들의 이름, 사번, 급여, 커미션, 1년 수입은? 
-- 단, 1년 수입 = 1년 급여 + 커미션
-- nvl : null value
select ename as "이름", 
        empno as "사번", 
        job as 업무, 
        sal "급여", 
        comm as "커미션",
        (sal * 12) + nvl(comm, 0) as "1년 수입"
from emp;

-- null : 한번도 데이터가 들어오지 않은 상태
-- 집계함수 : 실제 값이 들어온 값만
select sum(comm), avg(comm)
from emp;

select * from emp;

-- 직원들의 수는?
select count(empno)
from emp;

-- 업무 (job)의 개수는?
select count(distinct job)
from emp;

-- 직원들의 부서번호, 업무, 이름, 사번은?
select deptno, job, ename, empno
from emp
order by deptno asc;
-- desc : 내림차순, 테이블 설명
-- asc  : 오름차순

-- 직원들의 부서번호[내림차순], 업무[오름차순], 이름, 사번은?
select deptno, job, ename, empno
from emp
order by deptno desc, job asc;

-- 직원들의 이름, 사번, 상관의 사번은?
-- 상관의 사번순으로 정렬.
select ename, empno, mgr
from emp
order by mgr nulls FIRST;
-- null 밑으로 nulls last
-- null 맨 앞으로 nulls first

-----------------------------------------------------------------
-----------------------------------------------------------------

-- 스미스의 이름, 사번은?
select ename as 이름, empno as 사번
from emp
where ename = 'SMITH';

-- CLERK 업무를 하는 직원들의 이름, 사번, 업무는?
select ename, empno, job
from emp
where job = 'CLERK';

-- 급여가 1350이상인 직원들의 이름, 사번 급여는?
select ename as 이름, empno as 사번, sal as 급여
from emp
where (sal >= 1350);

-- 1년 수입이 30000 이상인 직원들의 이름, 사번, 1년 수입은?
select ename, empno, sal * 12 + nvl(comm, 0) as "1년 수입"
from emp
where (sal * 12 + nvl(comm, 0)) > 30000;

-- 81년 11월 1일 이후 입사자의 이름, 사번, 입사일자?
select ename, empno, hiredate
from emp
where hiredate between TO_DATE('1981-11-1', 'yy/MM/dd') and TO_DATE(SYSDATE, 'yy/MM/dd');

select ename, empno, hiredate
from emp
where hiredate >= TO_DATE('1981-11-1', 'yy/MM/dd');

select ename, empno, hiredate
from emp
where hiredate >= '1981/11/01';

---------------------------------
-- 현재 시간 보여줌
select sysdate from dual;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD';

---------------------------------
-- 급여가 1500 이상 직원들의 이름, 사번, 급여는?
select ename, empno, sal
from emp
where sal >= 1500;

-- 급여가 1500 이상, 3000 이하인 직원들의 이름, 사번, 급여는?
select ename, empno, sal
from emp
where 1500 <= sal and sal <= 3000;

select ename, empno, sal
from emp
where sal between 1500 and 3000;

-- 부서번호가 10이 아닌 직원들의 이름, 사번, 부서번호
select ename, empno, deptno
from emp
where deptno != 10;

select ename, empno, deptno
from emp
where deptno ^= 10;

select ename, empno, deptno
from emp
where deptno <> 10;

-- 성능상 좋지 않은 표현법
select ename, empno, deptno
from emp
where not (deptno = 10);

-- job이 clerk이고, 급여가 1000 미만인 이름, 사번, 직업, 급여
select ename, empno, job, sal
from emp 
where job = 'CLERK' and sal < 1000;

-- job이 clerk이고, 급여가 1000이상이고, 1982년 1월 1일 이후 입사이고, 부서번호가 20이 아닌 직원의 이름, 사번, 직업, 급여, 입사날짜, 부서번호
select ename, empno, job, sal, hiredate, deptno
from emp 
where job = 'CLERK' 
and sal >= 1000
and hiredate >= TO_DATE('1982/1/1', 'YYYY/MM/DD')
and deptno != 20;

-- 급여가 1250 또는 1500 또는 1600인 직원들의 이름, 급여는?
-- 어플리케이션 단계에서 오는 네트워크 구문은 동성능 가정하에 짧은 것이 좋다 
select ename, empno
from emp 
where sal in (1250, 1500, 1600);

-- job 이 'CLERK','ANALYST','PRESIDENT'인 직원들의 이름, 사번, job?
select ename, empno, job
from emp
where job in ('CLERK','ANALYST','PRESIDENT');

-- like, _ (한자리 아무거나), % (여러자리 아무거나)
-- 이름 두번째 자리가 A인 직원들의 이름 사번
select ename, empno
from emp
where ename like '_A%';

-- 1. A자로 시작하는 이름을 가진 직원들의 이름, 사번은?
select ename, empno
from emp
where ename like 'A%';

-- 2. A가 들어있는 이름을 가진 직원들의 이름, 사번은?
select ename, empno
from emp
where ename like '%A%';

-- 3. 뒤에서 두번째 자리에 E자가 있는 이름을 가진 직원들의 이름, 사번은?
select ename, empno
from emp
where ename like '%E_';

-- 4. 직속상관이 없는 직원들의 이름, 사번은?
-- null 은 상태
select ename, empno, mgr
from emp
where mgr is null;

-- 커미션이 있는 직원들의 이름, job, 커미션? (0원 포함)
select ename, job, comm
from emp
where comm is not null;


-- 커미션이 있는 직원들의 이름, job, 커미션? (0원 불포함)
select ename, job, comm
from emp
where comm > 0;

-- 커미션이 없는 직원들의 이름, job, 커미션? (0원 불포함)
select ename, job, comm
from emp
where comm is null;

-- 커미션이 없는 직원들의 이름, job, 커미션? (0원 포함)
select ename, job, comm
from emp
where comm is null or comm = 0;

select ename, job, comm
from emp
where nvl(comm, 0) = 0;

select ename, job, comm
from emp
where comm in (null, 0);
