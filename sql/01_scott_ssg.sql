-- 01_scott.sql

select * from emp;
-- SQL 
-- DDL(정의) - 틀 :Table
    create(생성), drop(제거), alter(변경)
-- DML(조작) - Data 
    insert(입력), update(수정), delete(삭제)
    select(조회)
-- DCL(제어) - 권한
    grant(허용), revoke(제거) 
-------------------------------------------------

직원들의 이름, 사번, 급여는?

select ename, empno, sal
from emp; 

직원들의 이름, 사번, 상관의 사번, 부서번호는 ?

select ename, empno, mgr, deptno
from emp;

부서들의 이름, 위치는 ?

select dname, loc
from dept;

select *
from dept;

select 10 + 20,10 - 20,10 * 20,10 / 20
from dual;

select '신세계' || 'INC'
from dual;

예) SMITH의 급여는 800 입니다.

select ename || ' 의 급여는 ' || sal || ' 입니다.'
from emp;

예) SMITH의 10% 인상된 급여는 880 입니다.

select ename || '의 10% 인상된 급여는' || sal*1.1 || '입니다.'
from emp; 

직원들의 이름, 사번, 업무(Job), 급여, 연봉은?
단, 연봉은 12개월치 급여입니다.

select  ename as "이름", 
        empno "사번", 
        job as 업무, 
        sal 급여, 
        sal*12 "연 봉"
from emp;

직원들의 이름, 사번, 급여, 커미션, 1년 수입은?
단, 1년 수입 = 12개월 급여 + 커미션

select ename, empno, sal, comm, (sal*12) + nvl(comm,0) "1년 수입"
from emp;

select sum(comm),avg(comm)
from emp;

직원들의 수는?

select count(empno)
from emp;

업무(Job)의 개수는?

select count(distinct job)
from emp;

직원들의 부서번호, 업무, 이름, 사번은 ?

select deptno, job, ename, empno
from emp
order by deptno desc; 
-> asc [오름차순] , desc [내림차순]

desc emp;

직원들의 부서번호[내림차순], 업무[오름차순], 이름, 사번은 ?

select deptno, job, ename, empno
from emp
order by deptno desc, job;

직원들의 이름, 사번, 상관의 사번은 ?
단, 상관의 사번순으로 정렬

select ename, empno, mgr
from emp
order by mgr nulls first;

-------------------------------------------------
==> 조건의 개수, 위치, 유형 [point, 범위, 열거, 상태, 패턴] 
 1) 일반조건 : column 대상 조건 
    => from ~ where (조건)
 2) 그룹조건 : 집계함수 결과 대상 조건 <-- 집계함수 count, min, max, sum, avg 
    => group by ~ having (조건)
-------------------------------------------------

스미스의 이름, 사번은?

select ename, empno
from emp 
where (ename = 'SMITH');

CLERK 업무를 하는 직원들의 이름, 사번, 업무는?

select ename, empno, job
from emp 
where (job = 'CLERK');

급여가 1350 이상인 직원들의 이름, 사번, 급여는?

select ename, empno, sal
from emp
where (sal >= 1350);

1년 수입이 30000 이상인 직원들의 이름, 사번, 1년 수입은?

select ename, empno, (sal*12)+nvl(comm,0) "1년 수입"
from emp 
where ((sal*12)+nvl(comm,0) >= 30000);

1981년 11월 1일 이후 입사자의 이름, 사번, 입사일자는?

select ename, empno, hiredate
from emp 
where (hiredate >= '1981/11/01');

-------------------------------------------------------------
select sysdate from dual;
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD';

------------------------------------------
급여가 1500 이상인 직원들의 이름, 사번, 급여는?

select ename, empno, sal
from emp 
where (sal >= 1500);

급여가 1500 이상이고, 3000 이하인 직원들의 이름, 사번, 급여는?
select ename, empno, sal
from emp 
where (sal >= 1500)
 and  (sal <= 3000) ;

select ename, empno, sal
from emp 
where (sal between 1500 and 3000);

----------------------------------------------------------------------
부서번호가 10이 아닌 직원들의 이름, 사번, 부서번호는?

select ename, empno, deptno
from emp
-- where (deptno = 10);
where (deptno != 10);
--where (deptno ^= 10);
--where (deptno <> 10);
--where not (deptno = 10);

job이 clerk 이고, 급여가 1000 미만인 직원들의 이름, 사번, job, 급여는?

select ename, empno, job, sal
from emp
where (job = 'CLERK')
 and  (sal < 1000 );

job이 clerk이고, 급여가 1000 이상이고, 1982년 1월 1일 이후 입사이고,
부서번호가 20 이 아닌 직원의 이름, 사번, job, 급여, 입사날짜, 부서번호는? ;

select ename, empno, job, sal, hiredate, deptno
from emp 
where (job = 'CLERK')
 and (sal >= 1000)
 and (hiredate > '1982/01/01')
 and (deptno != 20 );

급여가 1250 또는 1500 또는 1600 인 직원들의 이름, 급여는?

select ename, sal
from emp 
where (sal = 1250)
 or (sal = 1500)
 or (sal = 1600);

select ename, sal
from emp 
where (sal in (1250,1500,1600) );

job 이 'CLERK' , 'ANALYST', 'PRESIDENT' 인 직원들의 이름, 사번, job 은?

select ename, empno, job
from emp 
where (job in ('CLERK','ANALYST','PRESIDENT') );

-----------------------------------------------------
-> like , _ (한자리 아무거나) , % (여러자리 아무거나)

이름 두번째 자리가 'A'인 직원들의 이름, 사번은?

select ename, empno
from emp
where (ename like '_A%');


A 자로 시작하는 이름을 가진 직원들의 이름, 사번은?

select ename, empno
from emp
where ( ename like 'A%' );

이름에 A자가 들어있는 직원들의 이름, 사번은?

select ename, empno
from emp
where ( ename like '%A%' );

뒤에서 두번째 자리에 E 자가 있는 직원들의 이름, 사번은 ?

select ename, empno
from emp
where ( ename like '%E_' );

---------------------------------------------------------
직속상관이 없는 직원들의 이름, 사번, 상관번호는?

select ename, empno, mgr
from emp
where ( mgr is not null);

커미션이 있는 직원들의 이름, job, 커미션은? (0원 포함)

select ename, job, comm
from emp 
where (comm is not null);

커미션이 있는 직원들의 이름, job, 커미션은? (0원 불포함)

select ename, job, comm
from emp 
where (comm > 0);

커미션이 없는 직원들의 이름, job, 커미션은? (0원 불포함)
select ename, job, comm
from emp 
where (comm is null);

커미션이 없는 직원들의 이름, job, 커미션은? (0원 포함)
select ename, job, comm
from emp 
where (comm is null)
 or   (comm <= 0);

select ename, job, comm
from emp 
where (nvl(comm,0) <= 0);



---------------------------------------------------------
---------------------------------------------------------
-- 함수 : 문자함수, 숫자함수, 날짜함수, 변환함수, 집계함수 
-------------------------------------
--> - 문자함수 -
select 'Oracle', upper('Oracle'), lower('Oracle'), initcap('oraCle')
from dual;

select  length('Oracle'),lengthb('Oracle'),
        length('오라클'),lengthb('오라클')
from dual;

-- Welcome to Oracle

select substr('Welcome to Oracle',1,9)
from dual;

--> Quiz <----------------------------
-- 출력 e to Or

select substr('Welcome to Oracle', 7, 7)
from dual;

-- 출력 acl 
select substr('Welcome to Oracle', -4, 3)
from dual;

select substr('Welcome to Oracle', 14, 3)
from dual;

--------------------------------------
select  ltrim('   Welcome to Oracle'),
        rtrim('Welcome to Oracle   '),
        trim('  Welcome to Oracle  '),
        ltrim('Welcome to Oracle','Wel'),
        rtrim('Welcome to Oracle','cle')
from dual;

select ename, rpad(ename,10,'*'),lpad(ename,10,'#')
from emp;

select ename, sal, lpad(sal,10,' '), rpad(lpad(sal,10,' '),12,'원')
from emp;

-- replace : 주어진 단어 바꾸기
-- translate : 주어진 캐릭터 맞춰서 바꾸기
select  replace('Welcome to Oraclet','to','#@'),
        translate('Welcome to Oraclet','to','#@')
from dual;

--------------------------------------
--> - 숫자함수 -

select abs(10), abs(-10) from dual;

select ceil(10.123), ceil(10.543), ceil(11.001)
from dual;

select round(10.123), round(10.543), round(11.001)
from dual;
select trunc(10.123), trunc(10.543), trunc(11.001)
from dual;
select floor(10.123), floor(10.543), floor(11.001)
from dual;

select round(98.7654), round(98.7654,2), round(98.7654,-2)
from dual;

select mod(10,3),power(10,3) from dual;

--> Quiz <----------------------------
직원들의 이름, 급여, 10% 인상된 급여(단, 10의 자리 밑에는 절삭) ;

select ename, sal, trunc(sal * 1.1, -1 )
from emp;

--------------------------------------

--> - 날짜함수 -
오늘 날짜에서 40일전의 날짜를 출력하세요

select sysdate, sysdate - 40
from dual;

직원들의 이름, 입사날짜, 오늘까지의 근무일수는 ?; 

select ename, hiredate, rpad(trunc(sysdate - hiredate),7,'일')
from emp; 

직원들의 이름, 입사날짜, 오늘까지의 근무개월 수는 ?; 
select ename, hiredate, 
        rpad(trunc(months_between(sysdate,hiredate)),7,'개월') "근무개월"
from emp; 

--> - 변환함수 -
select sysdate - to_date('1988/08/08') from dual;

select ename, hiredate from emp;

select ename, to_char(hiredate,'YYYY-MM-DD HH:MM:SS') from emp;
select ename, to_char(hiredate,'YYYY-MM-DD HH24:MM:SS') from emp;
select ename, to_char(hiredate,'YYYY"년 " MM"월 " DD"일 " HH24:MM:SS') from emp;

select to_char(sysdate,'YYYY"년 " MM"월 " DD"일 " HH24:MM:SS') from dual;

-- L : 지금 서버있는 나라의 화폐단위
select 10000, to_char(10000,'$999,999'), to_char(10000,'L999,999')
from dual;


select to_number('12345'), cast('12345' as number(5))
from dual;

--> Quiz <----------------------------
--> 아래의 결과가 60이 나올수 있도록 함수를 이용해서 수정해보세요 

select  '10a' + '20bcbbcbbbcbbb' + 'de3de0de'
from dual;

select  TO_NUMBER(rtrim('10a', 'a')) + TO_NUMBER(substr('20bcbbcbbbcbbb', 1, 2)) + TO_NUMBER(replace('de3de0de', 'de', '')) as "결과"
from dual;

select  TO_NUMBER(rtrim('10a', 'a')) + TO_NUMBER(translate('20bcbbcbbbcbbb', 'bc', '  ')) + TO_NUMBER(replace('de3de0de', 'de', '')) as "결과"
from dual;
--------------------------------------



--------------------------------------
--> 집계함수 : count(), min(), max(), sum(), avg()
--------------------------------------
select count(empno), min(sal), max(sal), sum(sal), trunc(avg(sal))
from emp;

-- 업무(job)별 직원수?
select job, count(empno)
from emp
group by job;


-- 부서번호별 직원수
select deptno, count(empno)
from emp
group by deptno;

-- job 별 직원수, 최소급여, 최대급여, 급여합계, 급여평균 (job으로 정렬 내림차순)
select job, count(empno), min(sal), max(sal), sum(sal), trunc(avg(sal))
from emp
group by job
order by job desc;

-- job 별 평균 급여가 2000이 넘는 job, 평균급여는?
select job, avg(sal)
from emp
group by job
having avg(sal) > 2000;

-- 부서번호별 직원수가 4명 이상인 부서번호ㅡ 직원수 
select deptno, count(empno)
from emp
group by deptno
having count(empno) >= 4;

-- 81년 4월 29일 이후 입사자의 업무별 평균급여
select job, avg(sal)
from emp
where hiredate >= '1981/4/29'
group by job;

-- 업무별 급여 합계액이 5500을 넘는 업무과 급여합계액은?
select job, sum(sal)
from emp
group by job
having sum(sal) > 5500;

-- 81년 4월 29일 이후 입사가 업무별 평균급여가 2000이 넘는 업무와 평균급여
select job, avg(sal)
from emp
where hiredate >= '1981/04/29'
group by job
having avg(sal) > 2000;


-- 직원들의 커미션 평균
select trunc(sum(comm) / count(nvl(comm, 0))) 
from emp;

select trunc(avg(nvl(comm, 0))) 
from emp;