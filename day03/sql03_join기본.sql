/*
 * JOIN
 * */
-- 개념

-- 정규화되어 나누어진 테이블의 데이터를 한꺼번에 모아서 쉽게 출력하게 위해 사용
SELECT *
FROM employees e, departments d
WHERE e.department_id = d.DEPARTMENT_ID; 

-- 총 데이터수가 2889개 출력
-- 카티션 곱
SELECT *
FROM employees e, departments d;

-- 오라클 방식,표준 방식 아님, 편하게 쿼리를 작성하고 만든 편법
SELECT *
FROM employees e, departments d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- ANSI 표준 문법
SELECT *
FROM EMPLOYEES e 
INNER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- 필요컬럼만 명세
SELECT e.employee_id, e.FIRST_name || ' ' || e.last_name AS full_name
	 , e.EMAIL, e.PHONE_NUMBER
	 , e.HIRE_DATE, e.JOB_ID
	 , d.DEPARTMENT_NAME
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID ;
