/*
 * PL/SQL
 * */

-- SET SERVEROUTPUT ON; -- 콘솔에서만 사용 가능
DECLARE --선언부, 여기에 사용할 모든 변수를 선언해야함
	v_empno		emp.empno%TYPE; --number(4,0);를 대체해서 특정테이블의 컬럼과 같은 데이터타입을 쓰겠다고 선언
	v_ename		varchar2(10); --emp.ename%TYPE와 동일
BEGIN --PL/SQL은 시작
	SELECT empno, ename INTO v_empno, v_ename -- 변수값을 할당
	FROM emp
	WHERE empno = :empno; --DYNAMIC 변수 원래 &empno가 규칙
	-- dbeaver 시스템 상 :empno
	
	-- 정상실행
	DBMS_OUTPUT.PUT_LINE(v_empno || '-이 멤버의 이름은' || v_ename);
EXCEPTION --예외처리
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('멤버가 없음');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('데이터가 너무 많음');

END; -- PL/SQL 종료

COMMIT;