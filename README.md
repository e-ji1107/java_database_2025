# java_database_2025
Java 개발자 과정 Database

## 1일차
- Github Desktop 설치
    - https://desktop.github.com/download/  다운로드
    - 기존 Github 계정으로 SignIn with Browser
    - Git 명령어 없이 사용가능

- Database(DB) 개요
    - 데이터를 저장하는 장소, 서비스를 하는 서버
    - 데이터베이스를 관리하는 프로그램 DBMS
    - 가장 유명한 것 : Oracle
    - 사용자는 SQL로 요청, DB 서버는 처리 결과를 테이블로 리턴

- Oracle 설치
    1. powershell 오픈

    2. pull 내려받기
    ``` shell
    docker pull oracleinanutshell/oracle-xe-11g
    ```
    
    3. 다운로드 이미지 확인
    ``` shell
    PS C:\Users\Admin> docker image ls
    PS C:\Users\Admin> docker image ls
    REPOSITORY                        TAG       IMAGE ID       CREATED        SIZE
    pkej                              1.1       57b37152eb35   22 hours ago   1.66GB
    ej                                1.2       2b1ca54469c5   24 hours ago   1.76GB
    oracleinanutshell/oracle-xe-11g   latest    8b740e77d4b9   6 years ago    2.79GB
    ```

    4. 도커 컨테이너 실행
    ```shell
    PS C:\Users\Admin> docker run --name oracle11g -d -p 1521:1521 --restart=always oracleinanutshell/oracle-xe-11g
    ```
    - 1521 : 오라클 기본 포트
    - 아이디 system / oracle

    5. 도커 실행 확인
        - Docker Desktop > Containers 확인

    6. Powershell 오픈
    ``` shell
    > docker exec -it oracle11g bash
    [orkcle@...~]$ sqlplus / as sysdba
    SQL >
    ```

    7. DBaaver 접속
        - Connectkon > Select your DB > Oracle 선택
        <img src="./day01/image/db001.png" width = "650">

- DBeaver 툴 설치
    - https://dbeaver.io/download/




- SQL의 구성요소 3가지
    - 언어의 특징을 가지고 있음
        - 프로그래밍 언어와 차이 : 어떻게(How)
        - SQL : 무엇(What)
    - DDL(Data Definition Lang) : 데이터베이스 생성, 테이블 생성, 객체 생성, 수정, 삭제
        - CREATE, ALTER, DROP ...
    - DCL(Data Control Lang) : 사용자 권한 부여, 해제, 트랜잭션 시작, 종료
        - GRANT, REVOKE, BEGIN TRANS, COMMIT, ROLLBACK
    - DML(Data Manupulation Lang) : 데이터 조작 언어(핵심), 데이터 삽입, 조회, 수정, 삭제
        - INSERT, SELECT, UPDATA, DELETE
docker image ls
- SELECT 기본
    - 데이터 조회 시 사용하는 기본 명령어
        ```sql
        -- 기본 주석(한줄)
        /*여러줄 주석
        여러줄로 주석 작성가능*/
        SELECT [ALL|DISTINCT] [*|컬럼명(들)]
        FROM 테이블명(들)
        [WHERE 검색조건(들)]
        [GROUP BY 속성명(들)] 
        [HAVING 집계함수조건(들)]
        [ORDER BY 정렬속성(들) ASC|DESC]
        [WITH ROLLUP]
        ```
 - 기본 쿼리 학습: [SQL](./day01/sql01_select기본.sql)
        1. 기본 SELECT
        2. WHERE 조건절
        3. NULL(!)
        4. ORDER BY 정렬
        5. 집합



## 2일차
- 함수(계속)
    - 문자 함수: [SQL](./day02/sql02_함수2.sql)
    - 숫자 함수
    - 날짜 함수
    - 형변환함수
- 복수행함수 : [SQL](./day02/sql02_복수행함수.sql)
    - 집계함수
    - GROUP BY
    - HAVING
    - ROLLUP
    - RANK, DENSE_RANK, ROW_NUMBER

- 데이터베이스 타입형
    - **CHAR(n)** : 고정형 문자열, 최대 2000 바이트
        - CHAR(20)으로 'Hello World'를 저장하면, 'Hello World     '로 저장!(공백 포함됨)
    - **VARCHAR2(n)** : 가변형 문자열, 최대 4000 바이트
        - VARCHAR2(20)로 'Hello World'를 저장하면, 'Hello World'로 저장 
    - INTEGER : 모든 데이터의 기준. 4byte, 정수를 담는 데이터형
    - FLOAT(p) : 실수형 타입, 최대 22byte
    - **NUMBER(p,s)** : 숫자값, p 전체자리수, s 소수점 길이. 최대 22byte
    - **DATE** : 날짜 타입
    - **LONG** : 가변 길이 문자열, 최대 2G바이트
    - LONG RAW(n) : 원시 이진 데이터, 최대 2G바이트
    - CLOB : 대용량 텍스트 데이터 타입, 최대 4G
    - BLOB : 대용량 바이너리 데이터 타입, 최대 4G
    - BFILE : 외부 파일에 저장된 데이터, 4G

## 3일차
- JOIN : [SQL](./day03/sql03_join기본.sql)
    - ERD(Entity Relationship Diagram) : 개체 다이어그램
        - PK(Primary Key) : 기본키, 중복이 안되고 빠진 데이터가 없어야한다. UNIZUE, NOT NULL
        - FK(Foreign Key) : 외래키, 다른 테이블의 PK
        - Relationship : 부모 엔티티와 자식 엔티티간의 연관, 부모 1, 자식 N을 가질 수 있음
    - 카티션곱
        - 두 개 이상의 테이블의 조건과 관계없이 연결할 수 있는 경우의 수를 모두 만든 데이터
        - JOIN 이전에 데이터 확인하기 위해 사용, 실무에서 사용 X
    - 내부조인
        - 다중 테이블에서 보통 PK와 FK간의 일치하는 데이터를 한꺼번에 출력하기 위한 방법
        - 관계형 데이터베이스에서 필수로 사용해야 함
        - INNER JOIN 또는 오라클 간결 문법 사용
    - 외부조인
        - PK와 FK 간의 일치하지 않는 데이터도 출력하고자 할 때 사용하는 방법
        - LEFT OUTER JOIN, RIGHT OUTER JOIN 또는 오라클 간결문법 사용
- DDL : [SQL](./day03/sql04_DDL.sql)
    - CREATE : TABLE, VIEW, PROCEDURE, FUNCTION 개체를 생성하는 키워드
        - 타입형
        ```sql
        CREATE TABLE 테이블명 (
            첫번째_컬럼 타입형 제약조건,
            두번째_컬럼 타입형 제약조건,
            ...
            마지막_컬럼 타입형 제약조건
            [,
            기본키, 외래키 등의 옵션
            ]
        );
        ```
    - ALTER : 개체 중 테이블에서 수정이 필요할 때 사용하는 키워드
    ```SQL
    ALTER TABLE 테이블명 ADD(컬럼명 타입명 제약조건);
    ALTER TABLE 테이블명 MODIFY(컬럼명 타입명 제약조건);
    ```
    - DROP : 개체 삭제 시 사용하는 키워드
    ```SQL
    DROP TABLE 테이블명 PURGE; -- PURGE: 휴지통 -> 복구 가능
    ```
    - TRUNCATE : 테이블 완전 초기화 키워드
    ```SQL
    TRUNCATE TABLE 테이블명
    ```

## 4일차
- DML
    - INSERT
    - DELETE
    - UPDATE
- 제약조건
- INDEX
- VIEW
- 서브쿼리
- 시퀀스