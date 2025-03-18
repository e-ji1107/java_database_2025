-- trigger 학습
CREATE TABLE dept_backup
AS
 	SELECT * FROM dept;
-- dept_backup 테이블에 log_data 컬럼 추가
ALTER TABLE dept_backup
	  ADD COLUMN log_data

-- 트리거 작성
CREATE OR REPLACE TRIGGER trg_deptback
ALTER INSERT OR UPDATE ON dept -- dept테이블 트리거메뉴에서 저장된 것을 확인
FOR EACH ROW
BEGIN
	IF inserting THEN
		INSERT INTO dept_backup
		values(:NEW.deptno, :NEW.dname, :NEW.loc, sysdate);
	ELSIF updating THEN --dept 테이블에 데이터가 수정되면
		UPDATE dept_backup
		SET dname= :NEW.dname
			, loc = :NEW.dname
			, log_date = sysdate
		where deptno = :OLD.deptno;
/*	ELSIF deleting THEN
		DELETE FROM dept_backup
		WHERE deptno = :OLD.deptno;*/
	END IF;
END;

-- 원본확인
SELECT *
FROM dept;

-- 백업테이블 확인
SELECT * FROM dept_backup;

-- 삽입
INSERT INTO dept values(50,'R&D','SEOUL');

-- 수정, boston 에서 los angeles로 변경
UPDATE dept SET
loc = 'los angeles'
WHERE deptno = 40;
