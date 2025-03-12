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
    - 문자 함수: 
    - 숫자 함수:
    - 날짜 함수:
    - 형변환함수

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