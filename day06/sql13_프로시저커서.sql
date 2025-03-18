CREATE OR REPLACE PROCEDURE EMP_LIST
IS
	CURSOR cur_emp IS
		SELECT empno, ename,job
		FROM emp;
BEGIN
	FOR emp_cnt IN cur_emp
	LOOP
		dbms_output.put_line(emp_cnt.empno || ',' || emp_cnt.ename || ',' || emp_cnt.job);
		
	END LOOP;
	
END EMP_LIST;
