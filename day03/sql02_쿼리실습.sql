SELECT max(sal+comm), min(sal+comm), avg(sal+comm)
FROM emp;


-- p39 연습문제 1
SELECT name || '''s ID:' || id ||',' ||'weight is ' ||  weight || 'kg' AS "ID AND WEIGHT"
FROM student;

