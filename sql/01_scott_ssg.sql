-- 01_scott.sql

select * from emp;
-- SQL 
-- DDL(����) - Ʋ :Table
    create(����), drop(����), alter(����)
-- DML(����) - Data 
    insert(�Է�), update(����), delete(����)
    select(��ȸ)
-- DCL(����) - ����
    grant(���), revoke(����) 
-------------------------------------------------

�������� �̸�, ���, �޿���?

select ename, empno, sal
from emp; 

�������� �̸�, ���, ����� ���, �μ���ȣ�� ?

select ename, empno, mgr, deptno
from emp;

�μ����� �̸�, ��ġ�� ?

select dname, loc
from dept;

select *
from dept;

select 10 + 20,10 - 20,10 * 20,10 / 20
from dual;

select '�ż���' || 'INC'
from dual;

��) SMITH�� �޿��� 800 �Դϴ�.

select ename || ' �� �޿��� ' || sal || ' �Դϴ�.'
from emp;

��) SMITH�� 10% �λ�� �޿��� 880 �Դϴ�.

select ename || '�� 10% �λ�� �޿���' || sal*1.1 || '�Դϴ�.'
from emp; 

�������� �̸�, ���, ����(Job), �޿�, ������?
��, ������ 12����ġ �޿��Դϴ�.

select  ename as "�̸�", 
        empno "���", 
        job as ����, 
        sal �޿�, 
        sal*12 "�� ��"
from emp;

�������� �̸�, ���, �޿�, Ŀ�̼�, 1�� ������?
��, 1�� ���� = 12���� �޿� + Ŀ�̼�

select ename, empno, sal, comm, (sal*12) + nvl(comm,0) "1�� ����"
from emp;

select sum(comm),avg(comm)
from emp;

�������� ����?

select count(empno)
from emp;

����(Job)�� ������?

select count(distinct job)
from emp;

�������� �μ���ȣ, ����, �̸�, ����� ?

select deptno, job, ename, empno
from emp
order by deptno desc; 
-> asc [��������] , desc [��������]

desc emp;

�������� �μ���ȣ[��������], ����[��������], �̸�, ����� ?

select deptno, job, ename, empno
from emp
order by deptno desc, job;

�������� �̸�, ���, ����� ����� ?
��, ����� ��������� ����

select ename, empno, mgr
from emp
order by mgr nulls first;

-------------------------------------------------
==> ������ ����, ��ġ, ���� [point, ����, ����, ����, ����] 
 1) �Ϲ����� : column ��� ���� 
    => from ~ where (����)
 2) �׷����� : �����Լ� ��� ��� ���� <-- �����Լ� count, min, max, sum, avg 
    => group by ~ having (����)
-------------------------------------------------

���̽��� �̸�, �����?

select ename, empno
from emp 
where (ename = 'SMITH');

CLERK ������ �ϴ� �������� �̸�, ���, ������?

select ename, empno, job
from emp 
where (job = 'CLERK');

�޿��� 1350 �̻��� �������� �̸�, ���, �޿���?

select ename, empno, sal
from emp
where (sal >= 1350);

1�� ������ 30000 �̻��� �������� �̸�, ���, 1�� ������?

select ename, empno, (sal*12)+nvl(comm,0) "1�� ����"
from emp 
where ((sal*12)+nvl(comm,0) >= 30000);

1981�� 11�� 1�� ���� �Ի����� �̸�, ���, �Ի����ڴ�?

select ename, empno, hiredate
from emp 
where (hiredate >= '1981/11/01');

-------------------------------------------------------------
select sysdate from dual;
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD';

------------------------------------------
�޿��� 1500 �̻��� �������� �̸�, ���, �޿���?

select ename, empno, sal
from emp 
where (sal >= 1500);

�޿��� 1500 �̻��̰�, 3000 ������ �������� �̸�, ���, �޿���?
select ename, empno, sal
from emp 
where (sal >= 1500)
 and  (sal <= 3000) ;

select ename, empno, sal
from emp 
where (sal between 1500 and 3000);

----------------------------------------------------------------------
�μ���ȣ�� 10�� �ƴ� �������� �̸�, ���, �μ���ȣ��?

select ename, empno, deptno
from emp
-- where (deptno = 10);
where (deptno != 10);
--where (deptno ^= 10);
--where (deptno <> 10);
--where not (deptno = 10);

job�� clerk �̰�, �޿��� 1000 �̸��� �������� �̸�, ���, job, �޿���?

select ename, empno, job, sal
from emp
where (job = 'CLERK')
 and  (sal < 1000 );

job�� clerk�̰�, �޿��� 1000 �̻��̰�, 1982�� 1�� 1�� ���� �Ի��̰�,
�μ���ȣ�� 20 �� �ƴ� ������ �̸�, ���, job, �޿�, �Ի糯¥, �μ���ȣ��? ;

select ename, empno, job, sal, hiredate, deptno
from emp 
where (job = 'CLERK')
 and (sal >= 1000)
 and (hiredate > '1982/01/01')
 and (deptno != 20 );

�޿��� 1250 �Ǵ� 1500 �Ǵ� 1600 �� �������� �̸�, �޿���?

select ename, sal
from emp 
where (sal = 1250)
 or (sal = 1500)
 or (sal = 1600);

select ename, sal
from emp 
where (sal in (1250,1500,1600) );

job �� 'CLERK' , 'ANALYST', 'PRESIDENT' �� �������� �̸�, ���, job ��?

select ename, empno, job
from emp 
where (job in ('CLERK','ANALYST','PRESIDENT') );

-----------------------------------------------------
-> like , _ (���ڸ� �ƹ��ų�) , % (�����ڸ� �ƹ��ų�)

�̸� �ι�° �ڸ��� 'A'�� �������� �̸�, �����?

select ename, empno
from emp
where (ename like '_A%');


A �ڷ� �����ϴ� �̸��� ���� �������� �̸�, �����?

select ename, empno
from emp
where ( ename like 'A%' );

�̸��� A�ڰ� ����ִ� �������� �̸�, �����?

select ename, empno
from emp
where ( ename like '%A%' );

�ڿ��� �ι�° �ڸ��� E �ڰ� �ִ� �������� �̸�, ����� ?

select ename, empno
from emp
where ( ename like '%E_' );

---------------------------------------------------------
���ӻ���� ���� �������� �̸�, ���, �����ȣ��?

select ename, empno, mgr
from emp
where ( mgr is not null);

Ŀ�̼��� �ִ� �������� �̸�, job, Ŀ�̼���? (0�� ����)

select ename, job, comm
from emp 
where (comm is not null);

Ŀ�̼��� �ִ� �������� �̸�, job, Ŀ�̼���? (0�� ������)

select ename, job, comm
from emp 
where (comm > 0);

Ŀ�̼��� ���� �������� �̸�, job, Ŀ�̼���? (0�� ������)
select ename, job, comm
from emp 
where (comm is null);

Ŀ�̼��� ���� �������� �̸�, job, Ŀ�̼���? (0�� ����)
select ename, job, comm
from emp 
where (comm is null)
 or   (comm <= 0);

select ename, job, comm
from emp 
where (nvl(comm,0) <= 0);



---------------------------------------------------------
---------------------------------------------------------
-- �Լ� : �����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, �����Լ� 
-------------------------------------
--> - �����Լ� -
select 'Oracle', upper('Oracle'), lower('Oracle'), initcap('oraCle')
from dual;

select  length('Oracle'),lengthb('Oracle'),
        length('����Ŭ'),lengthb('����Ŭ')
from dual;

-- Welcome to Oracle

select substr('Welcome to Oracle',1,9)
from dual;

--> Quiz <----------------------------
-- ��� e to Or

select substr('Welcome to Oracle', 7, 7)
from dual;

-- ��� acl 
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

select ename, sal, lpad(sal,10,' '), rpad(lpad(sal,10,' '),12,'��')
from emp;

-- replace : �־��� �ܾ� �ٲٱ�
-- translate : �־��� ĳ���� ���缭 �ٲٱ�
select  replace('Welcome to Oraclet','to','#@'),
        translate('Welcome to Oraclet','to','#@')
from dual;

--------------------------------------
--> - �����Լ� -

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
�������� �̸�, �޿�, 10% �λ�� �޿�(��, 10�� �ڸ� �ؿ��� ����) ;

select ename, sal, trunc(sal * 1.1, -1 )
from emp;

--------------------------------------

--> - ��¥�Լ� -
���� ��¥���� 40������ ��¥�� ����ϼ���

select sysdate, sysdate - 40
from dual;

�������� �̸�, �Ի糯¥, ���ñ����� �ٹ��ϼ��� ?; 

select ename, hiredate, rpad(trunc(sysdate - hiredate),7,'��')
from emp; 

�������� �̸�, �Ի糯¥, ���ñ����� �ٹ����� ���� ?; 
select ename, hiredate, 
        rpad(trunc(months_between(sysdate,hiredate)),7,'����') "�ٹ�����"
from emp; 

--> - ��ȯ�Լ� -
select sysdate - to_date('1988/08/08') from dual;

select ename, hiredate from emp;

select ename, to_char(hiredate,'YYYY-MM-DD HH:MM:SS') from emp;
select ename, to_char(hiredate,'YYYY-MM-DD HH24:MM:SS') from emp;
select ename, to_char(hiredate,'YYYY"�� " MM"�� " DD"�� " HH24:MM:SS') from emp;

select to_char(sysdate,'YYYY"�� " MM"�� " DD"�� " HH24:MM:SS') from dual;

-- L : ���� �����ִ� ������ ȭ�����
select 10000, to_char(10000,'$999,999'), to_char(10000,'L999,999')
from dual;


select to_number('12345'), cast('12345' as number(5))
from dual;

--> Quiz <----------------------------
--> �Ʒ��� ����� 60�� ���ü� �ֵ��� �Լ��� �̿��ؼ� �����غ����� 

select  '10a' + '20bcbbcbbbcbbb' + 'de3de0de'
from dual;

select  TO_NUMBER(rtrim('10a', 'a')) + TO_NUMBER(substr('20bcbbcbbbcbbb', 1, 2)) + TO_NUMBER(replace('de3de0de', 'de', '')) as "���"
from dual;

select  TO_NUMBER(rtrim('10a', 'a')) + TO_NUMBER(translate('20bcbbcbbbcbbb', 'bc', '  ')) + TO_NUMBER(replace('de3de0de', 'de', '')) as "���"
from dual;
--------------------------------------



--------------------------------------
--> �����Լ� : count(), min(), max(), sum(), avg()
--------------------------------------
select count(empno), min(sal), max(sal), sum(sal), trunc(avg(sal))
from emp;

-- ����(job)�� ������?
select job, count(empno)
from emp
group by job;


-- �μ���ȣ�� ������
select deptno, count(empno)
from emp
group by deptno;

-- job �� ������, �ּұ޿�, �ִ�޿�, �޿��հ�, �޿���� (job���� ���� ��������)
select job, count(empno), min(sal), max(sal), sum(sal), trunc(avg(sal))
from emp
group by job
order by job desc;

-- job �� ��� �޿��� 2000�� �Ѵ� job, ��ձ޿���?
select job, avg(sal)
from emp
group by job
having avg(sal) > 2000;

-- �μ���ȣ�� �������� 4�� �̻��� �μ���ȣ�� ������ 
select deptno, count(empno)
from emp
group by deptno
having count(empno) >= 4;

-- 81�� 4�� 29�� ���� �Ի����� ������ ��ձ޿�
select job, avg(sal)
from emp
where hiredate >= '1981/4/29'
group by job;

-- ������ �޿� �հ���� 5500�� �Ѵ� ������ �޿��հ����?
select job, sum(sal)
from emp
group by job
having sum(sal) > 5500;

-- 81�� 4�� 29�� ���� �Ի簡 ������ ��ձ޿��� 2000�� �Ѵ� ������ ��ձ޿�
select job, avg(sal)
from emp
where hiredate >= '1981/04/29'
group by job
having avg(sal) > 2000;


-- �������� Ŀ�̼� ���
select trunc(sum(comm) / count(nvl(comm, 0))) 
from emp;

select trunc(avg(nvl(comm, 0))) 
from emp;