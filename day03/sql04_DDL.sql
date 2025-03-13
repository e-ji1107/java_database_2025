/*
 * DDL - 데이터조작언어
 * CREATE, ALTER, DROP, TRUNCATE...
 * 객체를 생성, 수정, 삭제, 초기화 등
 * */

-- no, name, birth 컬럼의 테이블 new_table을 생성하시오
-- create table new_table();

CREATE TABLE new_table(
	NO number(5,0) PRIMARY KEY, -- PK는 지정하는게 기본
	jumin varchar2(14),
	NAME varchar2(20),
	birth date
);

--삭제
DROP TABLE new_table; 

-- 기본값을 설정하면서 테이블 생성
CREATE TABLE new_table(
	NO number(5,0) PRIMARY KEY, -- PK는 지정하는게 기본
	jumin varchar2(14) NOT NULL,
	NAME varchar2(20),
	birth DATE,
	salary number(7,0) DEFAULT 0 -- 아무값도 넣지않고 INSERT -> NULL을 0으로 대체
);

--테이블컬럼에 주석추가
COMMENT ON CLOUMN NEW_table.name IS '사원이름';

-- 기본키가 두개인 테이블 생성
CREATE TABLE doublekeytbl(
	ID number(5,0),
	code char(4),
	name varchar(20) NOT NULL,
	jumin char(14) UNIQUE,	
	CONSTRAINT pk_doublekeytbl PRIMARY key(id,code)
);

-- new_number 부모테이블과 new_board 자식테이블간의 관계가 성립된 테이블 생성
CREATE TABLE new_member(
	idx NUMBER PRIMARY KEY,
	name varchar2(20) NOT NULL,
	id varchar2(20) NOT NULL,
	pass varchar2(256) NOT null
);


CREATE TABLE new_board(
	bidx NUMBER PRIMARY KEY,
	title varchar2(125) NOT NULL,
	content LONG NOT NULL,
	reg_date DATE DEFAULT sysdate,
	count number(6,0) DEFAULT 0,
	midx NUMBER NOT NULL,
	CONSTRAINT fk_memberidx FOREIGN KEY(midx) REFERENCES new_member (idx)
);

-- atler 기존 테이블을 수정할 때 사용
-- 이미 데이터가 존재하는 테이블에 not null 컬럼은 추가 불가
ALTER TABLE new_table add(address varchar2(200));
ALTER TABLE new_table add(tel varchar2(20) NOT null);

-- 컬럼 수정 varchar2(200) -> varchar2(100)
ALTER TABLE new_table MODIFY (address varchar2(100));

-- drop 테이블 삭제
-- purge 휴지통으로 보냄
DROP TABLE new_table purge;

-- truncate 테이블 초기화
-- id(자동으로 증가하는) 1,2,3,4,5
TRUNCATE TABLE new_table;



