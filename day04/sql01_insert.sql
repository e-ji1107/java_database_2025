/*
 * DML 중 select 외
 * insert, update, delete
 * */
-- insert
select * 
from new_table;

-- insert query 기본
INSERT INTO new_table
values(1,'홍길동','810205-1825697','1981-02-05',5000,'부산','010');

-- 테이블 컬럼리스트와 동일한 순서, 동일한 값을 넣을 때
-- 단. 컬럼리스트와 순서도 다르고, 값 리스트 갯수도 다르면 컬럼리스트 생략 불가
INSERT INTO new_table
VALUES (2, '홍길동','810205-1825697','1981-02-05',5000,'부산','010');

-- 컬럼리스트 순서와 개수가 다를 때는 반드시 적어줘야한다
INSERT INTO new_table(jumin, name, no)
values('760921-1825899','성유곤',3);

--값이 뭔지 모를 때는 null로 삽입
INSERT INTO new_table
values(4,'홍길태','830105-1825699',NULL,NULL);

-- 한 테이블에 있는 데이터를 모두 옮기면서 새로운 테이블 생성
-- pk는 복사가 안됨
CREATE TABLE professor_new
AS
SELECT * FROM professor;


SELECT * FROM professor_new;

-- 만들어진 테이블에 데이터 한꺼번에 옮기기
INSERT INTO professor_new
SELECT * FROM professor;

--새로 만들어진 테이블 professor_new 데이터를 삽입 테스트
INSERT INTO professor_new (profno, name, id, position,pay, hiredate)
VALUES (5008,'tom cruise', 'cruise','instructor',300,'2025-03-14')

-- professor_new는 pk가 없기 때문에 같은 값이 들어감

-- 대량의 데이터를 삽입, oracle 방식
-- 대량의 데이터를 삽입. Oracle 방식
INSERT ALL
    INTO new_table values (5, '홍길길', '810205-1825697', '1981-02-05', 5000)
    INTO new_table values (6, '홍길평', '810205-1825697', '1981-02-05', 5000)
    INTO new_table values (7, '홍길리', '810205-1825697', '1981-02-05', 5000)
    INTO new_table values (8, '홍길군', '810205-1825697', '1981-02-05', 5000)
    INTO new_table values (9, '홍길치', '810205-1825697', '1981-02-05', 5000)
SELECT * FROM dual;

SELECT * FROM NEW_TABLE;

COMMIT;


