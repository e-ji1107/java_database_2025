/*
 * 복수행 함수 마무리
 * */

-- GROUP BY
-- 그룹핑시 GROUP BY에 들어가는 컬럼만 SELECT 절에 사용가능
-- where 절은 일반적 조건만 비교, having 집계함수를 조건에 사용할 때
SELECT department_id
	 , sum(salary)
FROM employees
WHERE department_id <= 70
GROUP BY department_id
HAVING sum(salary) <= 20000
ORDER BY 2 ASC; -- 2는 sum(salary)와 동일, SELECT 절의 순서에 따라


-- rank() 1,2,3,4,5
-- dense_rank() 1,2,2,3,4
-- row_number 행번호는 디비버 시스템 내의 번호 1,2,3,4,5
-- employees에서 급여가 높은 사람부터 순위 매기기

SELECT first_name || ' ' || last_name AS "full_name"
	 , salary
	 , department_id
	 , rank() OVER (ORDER BY salary desc) AS "rank"
	 , dense_rank() OVER (ORDER BY salary DESC ) AS "dense_rank"
	 , row_number() OVER (ORDER BY salary desc) AS "row_num"
FROM employees
WHERE salary IS NOT NULL;


-- 부서별(department_id), 급여높은 사람부터 랭킹을 매길 때
SELECT first_name || ' ' || last_name AS "full_name"
	 , salary
	 , department_id
	 , rank() OVER (PARTITION BY department_id ORDER BY salary desc) AS "rank"
	 , dense_rank() OVER (ORDER BY salary DESC ) AS "dense_rank" -- 일상에서 DENSE_RANK 더 사용
	 , row_number() OVER (ORDER BY salary desc) AS "row_num" -- PARTITION BY 잘 사용 안함
FROM employees
WHERE salary IS NOT NULL
ORDER BY department_id;


