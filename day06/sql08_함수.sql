CREATE OR REPLACE FUNCTION GET_DNAME
(
	v_deptno emp2.deptno%TYPE	
) RETURN VARCHAR2
IS
	deptname dept2.dname%TYPE;
BEGIN
	SELECT dname INTO deptname
	FROM dept2
	WHERE dcode = v_deptno;
END GET_DNAME;


