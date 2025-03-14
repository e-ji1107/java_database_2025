/*
 * update/delete
 * 데이터 변경/데이터삭제
 */
 * */
 -- 삭제
SELECT count(*) FROM professor_new;
DELETE FROM professor_new
WHERE profno = 1001;

DELETE FROM professor_new; -- TRUNCATE와 동일하나 테이블 초기화는 없음

-- 변경
-- PROFNO 4002 인 수잔 서랜든의 아이디를 기존 SHRANDON에서 SUSNAS로, 급여를 330에서 350으로 올리시오.
UPDATE professor_new SET
	   ID = 'SusanS'
	 , pay = 350
WHERE profno = 4002; 

UPDATE professor_new SET
	   id = 'SusanS'
	 , pay = 350
WHERE profno = 4002;

/*
 * 트랜잭션, COMMIT, ROLLBACK
 * */
	 
BEGIN TRANSACTION;

UPDATE professor_new SET
	   id = 'SusanS'
	 , pay = 350;

SELECT *
FROM professor_new;

ROLLBACK;
COMMIT;
	 