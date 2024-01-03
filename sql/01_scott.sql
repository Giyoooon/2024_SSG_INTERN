-- 01_scott.sql

select * from emp;

-- �������� �̸�, ���, �޿���?
select ename, empno, sal
from emp;

-- �������� �̸�, ���, ����� ���, �μ� ��ȣ��?
select ename, empno, mgr, deptno
from emp;

-- �μ����� �̸�, ��ġ��?
select dname, loc
from dept;

select 10 + 20, 10 - 20, 10 / 20, 10 * 20 
from dual;

select 'shinsegae' || ' inc'
from dual;

-- SMITH�� �޿��� 800 �Դϴ�
select ename || '�� �޿��� ' || sal || '�Դϴ�.'
from emp;


-- SMITH�� 10% �λ�� �޿��� 880�Դϴ�.
select ename || '�� 10% �λ�� �޿��� ' || sal*1.1 || '�Դϴ�.'
from emp;

-- �������� �̸�, ���, ����, �޿�, ������? �� ������ 12����ġ �޿��Դϴ�
select ename as "�̸�", 
        empno as "���", 
        job as ����, 
        sal "�޿�", 
        sal * 12 as "�� ��"
from emp;

-- �������� �̸�, ���, �޿�, Ŀ�̼�, 1�� ������? 
-- ��, 1�� ���� = 1�� �޿� + Ŀ�̼�
-- nvl : null value
select ename as "�̸�", 
        empno as "���", 
        job as ����, 
        sal "�޿�", 
        comm as "Ŀ�̼�",
        (sal * 12) + nvl(comm, 0) as "1�� ����"
from emp;

-- null : �ѹ��� �����Ͱ� ������ ���� ����
-- �����Լ� : ���� ���� ���� ����
select sum(comm), avg(comm)
from emp;

select * from emp;

-- �������� ����?
select count(empno)
from emp;

-- ���� (job)�� ������?
select count(distinct job)
from emp;

-- �������� �μ���ȣ, ����, �̸�, �����?
select deptno, job, ename, empno
from emp
order by deptno asc;
-- desc : ��������, ���̺� ����
-- asc  : ��������

-- �������� �μ���ȣ[��������], ����[��������], �̸�, �����?
select deptno, job, ename, empno
from emp
order by deptno desc, job asc;

-- �������� �̸�, ���, ����� �����?
-- ����� ��������� ����.
select ename, empno, mgr
from emp
order by mgr nulls FIRST;
-- null ������ nulls last
-- null �� ������ nulls first

-----------------------------------------------------------------
-----------------------------------------------------------------

-- ���̽��� �̸�, �����?
select ename as �̸�, empno as ���
from emp
where ename = 'SMITH';

-- CLERK ������ �ϴ� �������� �̸�, ���, ������?
select ename, empno, job
from emp
where job = 'CLERK';

-- �޿��� 1350�̻��� �������� �̸�, ��� �޿���?
select ename as �̸�, empno as ���, sal as �޿�
from emp
where (sal >= 1350);

-- 1�� ������ 30000 �̻��� �������� �̸�, ���, 1�� ������?
select ename, empno, sal * 12 + nvl(comm, 0) as "1�� ����"
from emp
where (sal * 12 + nvl(comm, 0)) > 30000;

-- 81�� 11�� 1�� ���� �Ի����� �̸�, ���, �Ի�����?
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
-- ���� �ð� ������
select sysdate from dual;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';
alter session set nls_date_format = 'YYYY/MM/DD';

---------------------------------
-- �޿��� 1500 �̻� �������� �̸�, ���, �޿���?
select ename, empno, sal
from emp
where sal >= 1500;

-- �޿��� 1500 �̻�, 3000 ������ �������� �̸�, ���, �޿���?
select ename, empno, sal
from emp
where 1500 <= sal and sal <= 3000;

select ename, empno, sal
from emp
where sal between 1500 and 3000;

-- �μ���ȣ�� 10�� �ƴ� �������� �̸�, ���, �μ���ȣ
select ename, empno, deptno
from emp
where deptno != 10;

select ename, empno, deptno
from emp
where deptno ^= 10;

select ename, empno, deptno
from emp
where deptno <> 10;

-- ���ɻ� ���� ���� ǥ����
select ename, empno, deptno
from emp
where not (deptno = 10);

-- job�� clerk�̰�, �޿��� 1000 �̸��� �̸�, ���, ����, �޿�
select ename, empno, job, sal
from emp 
where job = 'CLERK' and sal < 1000;

-- job�� clerk�̰�, �޿��� 1000�̻��̰�, 1982�� 1�� 1�� ���� �Ի��̰�, �μ���ȣ�� 20�� �ƴ� ������ �̸�, ���, ����, �޿�, �Ի糯¥, �μ���ȣ
select ename, empno, job, sal, hiredate, deptno
from emp 
where job = 'CLERK' 
and sal >= 1000
and hiredate >= TO_DATE('1982/1/1', 'YYYY/MM/DD')
and deptno != 20;

-- �޿��� 1250 �Ǵ� 1500 �Ǵ� 1600�� �������� �̸�, �޿���?
-- ���ø����̼� �ܰ迡�� ���� ��Ʈ��ũ ������ ������ �����Ͽ� ª�� ���� ���� 
select ename, empno
from emp 
where sal in (1250, 1500, 1600);

-- job �� 'CLERK','ANALYST','PRESIDENT'�� �������� �̸�, ���, job?
select ename, empno, job
from emp
where job in ('CLERK','ANALYST','PRESIDENT');

-- like, _ (���ڸ� �ƹ��ų�), % (�����ڸ� �ƹ��ų�)
-- �̸� �ι�° �ڸ��� A�� �������� �̸� ���
select ename, empno
from emp
where ename like '_A%';

-- 1. A�ڷ� �����ϴ� �̸��� ���� �������� �̸�, �����?
select ename, empno
from emp
where ename like 'A%';

-- 2. A�� ����ִ� �̸��� ���� �������� �̸�, �����?
select ename, empno
from emp
where ename like '%A%';

-- 3. �ڿ��� �ι�° �ڸ��� E�ڰ� �ִ� �̸��� ���� �������� �̸�, �����?
select ename, empno
from emp
where ename like '%E_';

-- 4. ���ӻ���� ���� �������� �̸�, �����?
-- null �� ����
select ename, empno, mgr
from emp
where mgr is null;

-- Ŀ�̼��� �ִ� �������� �̸�, job, Ŀ�̼�? (0�� ����)
select ename, job, comm
from emp
where comm is not null;


-- Ŀ�̼��� �ִ� �������� �̸�, job, Ŀ�̼�? (0�� ������)
select ename, job, comm
from emp
where comm > 0;

-- Ŀ�̼��� ���� �������� �̸�, job, Ŀ�̼�? (0�� ������)
select ename, job, comm
from emp
where comm is null;

-- Ŀ�̼��� ���� �������� �̸�, job, Ŀ�̼�? (0�� ����)
select ename, job, comm
from emp
where comm is null or comm = 0;

select ename, job, comm
from emp
where nvl(comm, 0) = 0;

select ename, job, comm
from emp
where comm in (null, 0);
