/*
 * 기본 select문
 * */
-- 1) Employees 테이블에서 사원번호, 이름(이름 성 합쳐서 표시), 급여, 업무, 입사일, 상사의 사원번호로 출력하시오(107)
SELECT employee_id, first_name || ' ' || last_name AS full_name, salary, job_id, to_char(hire_date,'yyyy-mm-dd') AS hire_date, manager_id
FROM employees;

-- 2) employees 테이블에서 모든 사원의 이름(last_name)과 연봉을 '이름:1year salary = $연봉' 형식으로 출력하고,
-- 컬럼명을 1 Year Salary로 변경하시오(107)
SELECT last_name, last_name || ' : 1 year salary'  || '=' || to_char(12*salary, '$9,999,999.99') AS "1 year salary"
FROM employees;

-- 3) 부서별로 담당하는 업무를 한번씩만 출력하시오(20)
SELECT DISTINCT department_id, job_id
FROM EMPLOYEES;

/*
 * Where절, Order by절
 * */

-- 4) employees에서 급여가 7000~10000 달러 범위 이외 사람의 이름과 성을 full_name, 급여를 오름차순으로 출력(75)
SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
where salary < 7000 or salary > 10000;

SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
where salary not BETWEEN 7000 AND 10000
ORDER BY salary ASC;

-- 5) 현재 날짜타입을 날짜 함수를 통해 확인하고, 
-- 입사일자가 2005년 5월 20일부터 2006년 5월 20일 사이에 입사한 사원의 이름(full_name), 사원번호, 고용일자를 출력하시오
-- 단 입사일을 빠른순으로 정렬하시오.
SELECT sysdate
FROM dual;

SELECT *
FROM employees;

SELECT first_name || ' ' || last_name AS full_name, employee_id, to_char(hire_date,'yyyy-mm-dd') AS hire_date
FROM employees
WHERE hire_date BETWEEN '2003-05-20' AND '2004-05-20'
ORDER BY hire_date;

/*
 * 단일행 함수와 변환 함수
 * */
-- 6) 이번 분기, 60번 IT부서가 지대한 공헌을 했음 
-- IT부서 사원 급여를 15.3% 인상하기로 함, 정수만 반올림
-- 출력형식은 사번, 이름과 성(full_name), 급여, 인상된 급여(Increased Salary)
SELECT employee_id, first_name || ' ' || last_name AS full_name, salary, salary + (salary * 0.153) AS Increased_Salary
--round(salary * 1.153) as "Increased Salary"
FROM employees
WHERE department_id = 60;

-- 6) 모든 사원의 연봉을 표시하는 보고서 작성
-- 사원 full_name, 급여, 수당여부에 따라 연봉을 표시하시오.
-- 수당이 있으면 Salary + Commission, 없으면 salary only라고 표시. 연봉이 높은 순으로 정렬(107)
SELECT first_name || ' ' || last_name AS full_name
	 , salary 
	 , (salary * 12) + (salary * nvl(commission_pct,0)) AS "Annual Salary"
	 , CASE WHEN commission_pct IS NULL THEN 'salary only'
	   	    WHEN commission_pct IS NOT NULL THEN 'salary + commission'
	   		END AS "Commission ?"
FROM employees
ORDER BY "Annual Salary" DESC; -- 컬럼순서 3 DESC 써도 됨.

/*
 * 집계함수, Min, Max, Avg, Count ,,,
 * */
-- 8) employees에서 각 사원이 소속된 부서별 급여 합계, 급여 평균, 급여 최대값, 급여 최대값 집계 하기
-- 출력 형식은 여섯자리와 세자리 구분 기호, $표시, 부서번호의 오름차순으로 정렬 
-- 단 부서에 소속되지 않은 사원은 제외(11)
SELECT department_id
	 , to_char(sum(salary), '$999,999') AS "Sum_Salary"
	 , to_char(avg(salary), '$999,999') AS "Sum_Salary"
     , to_char(max(salary), '$999,999') AS "Sum_Salary"
	 , to_char(min(salary), '$999,999') AS "Sum_Salary"
FROM employees
WHERE department_id IS NOT null
GROUP BY department_id
ORDER BY department_id ASC;

/*
 * Join
 * */
-- 9) employees, department, locations 테이블 구조 파악
-- Oxford에 근무하는 사원 full_name, 업무, 부서명, 도시명 출력(34)
SELECT 
    e.first_name || ' ' || e.last_name AS full_name, 
    e.department_id, 
    d.department_name, 
    l.city
FROM employees e, departments d, locations l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOCATION_ID = l.LOCATION_ID
AND l.CITY = 'Oxford';

COMMIT;

-- 10) 부서가 없는 직원까지 모두 full_name, 업무, 부서명 출력
-- left outer join

SELECT e.first_name || ' ' || e.last_name AS full_name, 
       e.department_id, 
       d.department_name
FROM EMPLOYEES e, DEPARTMENTS d 
WHERE e.DEPARTMENT_ID  = d.DEPARTMENT_ID(+);

/*
 * 서브쿼리
 * */
-- 11) Tucker 사원보다 급여를 많이 받는 사원의 full_name, 업무, 급여를 출력(15)
SELECT first_name || ' ' || last_name AS full_name, job_id, salary
FROM EMPLOYEES
WHERE salary > (SELECT salary
				FROM EMPLOYEES
				WHERE last_name = 'Tucker');

-- 12) 부서와 업무별 급여합계를 구하여 급여수준 레벨을 저장하고자 함
-- 부서별, 업무별 급여합계 및 각 부서별 총합, 각 부서별, 업무별 직원수를 출력하시오.
SELECT department_id, job_id, to_char(sum(salary),'$99,999') AS "Sum Salary", count(*) AS "Employees Cnt"
FROM EMPLOYEES
GROUP BY  ROLLUP (department_id, job_id);

COMMIT;

