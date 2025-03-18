-- PROCEDURE
-- 부서번호 30번인 사람의 job을 MANAGER로 변경하는 프로시저
-- SELECT * FROM emp;
CREATE OR REPLACE PROCEDURE update_30
IS
BEGIN 
	UPDATE emp SET
		   job = 'MANAGER'
	WHERE deptno = 30;
END;

SELECT * FROM emp;

COMMIT;
ROLLBACK;

CALL update_30();