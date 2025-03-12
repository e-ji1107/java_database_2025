/*단일행 함수*/
SELECT concat('hello','oracle') --  한 행에 한 열만 출력되는 값 : 스칼라(Scalar)값
FROM dual; -- 가상의 테이블

-- 인덱스가 1부터, 일반 프로그래밍 언어의 배열이 0부터 시작하는 것과의 차이
-- SUBSRT() - 파이썬 Substring() 함수와 동일
-- 인덱스 뒤에서부터 위치
SELECT substr(email, 1,2)
	 , substr(email, -2,2)
	 , email
from Employees; 

-- 전화번호 자를 때, 주민번호 자를 때, substr() 활용

-- INSTR(체크할 문자열, 찾는 글자, 시작 위치, 몇번째)
SELECT '010-9999-8888', instr('010-9999-8888', '-',1,1)
FROM dual;

--LPAD(문자열, 자리수, 채울 문자)
-- 2025-11-23
-- 2025-3-12 -> 2025-03-12
--0000100 이 규칙일 때, 101->0000101으로 만들때 사용
SELECT LPAD('100',7,'0'), RPAD('ABC',7,'-')
FROM dual;

--TRIM() 함수 트리플. 파이썬 strip() 함수와 동일
--LTRIM(), RTRIM(), TRIM()
SELECT '<<<' || '     hello oracle     ' || '>>>',
	   '<<<' || ltrim('     hello oracle     ') || '>>>',
	   '<<<' || rtrim('     hello oracle     ') || '>>>',
	   '<<<' || trim('     hello oracle     ') || '>>>'
FROM dual;

-- replace(), 파이썬과 동일
SELECT phone_number
	 , replace(EMPLOYEES.PHONE_NUMBER ,'123','786')
FROM employees;

------------------------------------------------------

/*숫자함수*/
-- round() : 반올림
-- ceil() : 올림
-- floor() : 내림
-- trunc() : 내림함수 소수점 o
-- mod() : 나누기 나머지값, 파이썬 mode, %
-- power() 파이썬 math.pow(), pow(), power(), 2^10 승수 계산
SELECT 786.5427 AS res1
			   , round(786.5427) AS round0 -- 소수점 x
			   , round(786.5427,1) AS round1 -- 소수점 1
			   , round(786.5427,2) AS round2 -- 소수점 2
			   , ceil(786.5427) AS ceilRes
			   , FLOOR(786.542) AS floorRes
			   , trunc(786.5427,2) AS truncRes
			   , mod(10,3) AS "나머지"
			   , power(2,10) AS "2의 10승"
FROM  dual;

------------------------------------------------------

/*
 * 날짜 함수, 나라마다 표현방식 다름
 * 2025-03-12 아시아
 * March/12/2025 미국, 캐나다, 등
 * 12/marc/2025 유럽, 인도
 */

SELECT sysdate -- GMT 기준, +09 필요
	 , TO_CHAR(sysdate, 'YYYY-MM-DD day') AS 한국식-- www, DAY 등
	 , TO_CHAR(sysdate, 'am HH24:MI:SS') AS 시간
	 , TO_CHAR(sysdate, 'MON/DD/YYYY') AS 미국식
	 , TO_CHAR(sysdate, 'DD/mon/YYYY') AS 영국식
FROM dual;

-- ADD_MONTHS() 월 추가 함수
-- mon, tue, wen, thr, pri, sat, sun
SELECT hire_date
	 , to_char(hire_date,'yyyy-mm-dd') AS 입사일자
	 , add_months(hire_date,3) AS 정규직일자
	 , next_day(hire_date,'월') AS 돌아오는월요일 --'mon' == '월'
	 , last_day('2025-02-01') AS 달의마지막날
FROM employees;

-- GMT + 9Hour
-- 인터벌 숫자뒤 hour, day, month, year
SELECT To_char(sysdate + INTERVAL '9' HOUR, 'yyyy-mm-dd hh24:mi:ss') AS seoul_time
FROM dual;

------------------------------------------------------


/*형 변환 함수*/
-- TO_CHAR() : 숫자형을 문자형으로 변경
SELECT 12345 AS 원본
	 , to_char(12345, '9999999') AS "원본+두자리"
	 , to_char(12345, '0999999') AS "원본+두자리0"
	 , to_char(12345, '$99999') AS "통화단위+원본"
	 , to_char(12345, '99999.99') AS "소수점"
	 , to_char(12345, '99,999') AS "천단위쉼표"
FROM dual;

-- TO_NUMBER() : 문자형으로 된 데이터를 숫자로
SELECT '5.0' * 5
	 , TO_number('5.0') AS 숫자형변환
--   , to_number('hello') 숫자로 형변환 불가능한 형태
FROM dual;

-- TO_DATE() : 날짜 형태를 문자형으로
SELECT '2025-03-12'
	 , to_date('2025-03-12') + 10 -- 날짜형으로 바꾸면 연산 가능
FROM dual;


------------------------------------------------------

/*일반 함수*/
-- NVL(컬럼|데이터, 바꿀 값) 널값을 다른값으로 치환
SELECT commission_pct
	 , nvl(commission_pct, '0.0')
FROM employees;

SELECT nvl(hire_date,sysdate) --입사일자가 비어있으면 오늘 날짜로 대체
FROM employees e;

-- NVL2(컬럼|데이터, 널이 아닐 때 처리, 널일 때 처리할 부분)
SELECT commission_pct
	 , salary
	 , nvl2(commission_pct, salary + (salary*commission_pct), salary ) AS 커미션급여
FROM employees;

-- DECODE(A,B,'1','2') A가 B일 경우 1 아니면 2
-- 오라클만 있는 함수
SELECT email, phone_number, job_id
	 , decode(job_id, 'IT_PROG', '개발자짱','우우붐따') AS 캐치프레이즈
from employees;
--WHERE job_id = 'IT_PROG';

------------------------------------------------------
/* CASE 구문, 중요
 * if, elif와 유사 */

SELECT CASE employee_id WHEN 100 THEN '사장'
						WHEN 101 THEN '부사장'
						WHEN 102 THEN '부사장'
END
, employee_id
, job_id
FROM employees;
------------------------------------------------------
SELECT CASE job_id WHEN 'AD_PERS' THEN '사장'
						WHEN 'AD_VP' THEN '부사장'
END AS 직급
, employee_id
, job_id
FROM employees;
-------------------------------------------------------
SELECT CASE job_id WHEN 'AD_PERS' THEN '사장'
                   WHEN 'AD_VP' THEN '부사장'
                   WHEN 'IT_PROG' THEN '프로그래머'
                   WHEN 'SA_MAN' THEN '영업사원'
                   ELSE '미분류'
END AS 직급
, employee_id
, job_id
FROM employees;

-------------------------------------------------------
/*정규식(Regula Expression) : 문자열 패턴을 가지고, 동일한 패턴 데이터 추출 사용
 * ^, $, . , *, [], [^] 패턴인식할때 필요한 키워드.
 * */
SELECT *
FROM EMPLOYEES
WHERE phone_number LIKE '%.%.%'; -- 세자리 전화, 네자리 전화 구분 안됨

------------------------------------------------------
-- 전화번호가 .으로 구분되는 세자리 번호 필터링
SELECT *
FROM EMPLOYEES
WHERE REGEXP_LIKE(phone_number,'[0-9]{3}.[0-9]{3}.[0-9]{4}');

------------------------------------------------------
-- first_name이 J로 시작되고, 두번째 글자가 A나 O인 사람을 출력하시오
SELECT *
FROM employees
WHERE regexp_like(first_name,'^j(a|o)');
