--
SELECT * FROM emp;

-- 프로시저 연습 실행
CALL professor_info(2001);

CALL emp_info(7934);

CALL emp_list();

-- for문
DECLARE
	v_sum 	NUMBER;
BEGIN
	v_sum := 0;
	FOR i IN 1..100 LOOP
		v_sum := v_sum + i;
	END LOOP;

	dbms_output.put_line(v_sum);
END;
/

