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
FROM EMPLOYEES e , DEPARTMENTS d , LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 


-- 내부 조인(INNER JOIN)
SELECT e.employee_id, e.FIRST_name || ' ' || e.last_name AS full_name
	 , e.EMAIL, e.PHONE_NUMBER
	 , e.HIRE_DATE, e.JOB_ID
	 , d.DEPARTMENT_NAME
	 , d.DEPARTMENT_ID
	 , l.CITY, l.STATE_PROVINCE, l.STREET_ADDRESS
FROM EMPLOYEES e , DEPARTMENTS d , LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND l.LOCATION_ID = d.LOCATION_ID;
AND d.department_id = 60;


-- ANSI 표준은 오라클방식보다 복잡
SELECT e.employee_id, e.FIRST_name || ' ' || e.last_name AS full_name
	 , e.EMAIL, e.PHONE_NUMBER
	 , e.HIRE_DATE, e.JOB_ID
	 , d.DEPARTMENT_NAME
	 , d.DEPARTMENT_ID
	 , l.CITY, l.STATE_PROVINCE, l.STREET_ADDRESS
FROM EMPLOYEES e
INNER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
INNER JOIN locations l
ON l.LOCATION_ID  = d.LOCATION_ID
WHERE d.DEPARTMENT_ID = 60;

--외부조인
-- 보통 PK와 FK간의 일치하는 조건의 데이터를 찾는 것 : 내부 조인
-- PK와 FK간의 일치하지 않는 조건의 데이터도 찾는 것 : 외부 조인
-- 테이블 1 OUTER JOIN 테이블 2
-- 테이블 1번을 기준으로 외부조인 LEFT OUTER JOIN
-- 테이블 2번을 기준으로 내부조인 RIGHT OUTER JOIN

-- ANSI 표준문법
-- employees 테이블에는 있는데 departments 테이블에 없는 데이터 출력
SELECT *
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

--departments 테이블에는 있는데 employees 테이블에 없는 데이터 출력
SELECT *
FROM EMPLOYEES e
RIGHT OUTER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;


--oracle 문법
-- (+)만족하지 않는 조건도 더 나오게 한다는 뜻
-- LEFT OUTER JOIN
SELECT *
FROM employees e, departments d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+);

--RIGHT OUTER JOIN
SELECT *
FROM employees e, departments d
WHERE e.department_id(+) = d.DEPARTMENT_ID;

-- inner join은 생략 가능
-- outer join 에만 leftm right존재하므로 outer 생략 가능

-- 셀프 조인: 자기자신을 2번 사용하는 조인
SELECT e1.EMPLOYEE_ID
	 , e1.FIRST_NAME || ' ' || e1.LAST_NAME AS "full emp name"
	 , e1.job_id
	 , e1.MANAGER_ID
	 , e2.FIRST_NAME
	 , e2.FIRST_NAME || ' ' || e2.LAST_NAME AS "full mng name"
	 , e2.JOB_ID
FROM employees e1, EMPLOYEES e2
WHERE e2.EMPLOYEE_ID = e1.MANAGER_ID(+)
ORDER BY e1.MANAGER_ID ;
