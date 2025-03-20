## 토이프로젝트
Python GUI - Oracle 연동 프로그램

### GUI 프레임워크
    1. tkinter - 파이썬에 내장된 GUI 라이브러리
    2. PyQt / PySide 
        - C/C++에서 사용하는 GUI 프레임워크 Qt를 파이썬에 사용하게 만든 라이브러리. 현재 6버전 출시, 유료
        - PyQt의 사용라이센스 문제로 PySide 릴리즈. PyQt에서 PySide로 변겅하는데 번거로움 존재
        - tkinter 보다 난이도가 있음
        - 아주 이쁨. QtDesigner툴로 포토샵처럼 GUI 디자인 가능
        - Python GUI중에서 가장 많이 사용중
    3. Kivy
        - OpenGL(게임엔진용 3D 그래픽엔진)으로 구현되는 GUI 프레임워크
        - 안드로이드, iOS 등 모바일용으로도 개발 가능
        - 최신에 나온 기술이라 아직 불안정
    4. wxPyton
        - Kivy처럼 멀티플랫폼 GUI 프레임워크
        - 매우 어려움

### PyQt5 GUI 사용
- PyQt5 설치
    - 콘솔 pip install PyQt5

- QtDesigner 설치
    - https://build-system.fman.io/qt-designer-download 다운로드 후 설치

#### PyQt5 개발
1. PyQt 모듈 사용 윈앱 만들기
2. 윈도우 기본 설정
3. PyQt 위젯 사용법(레이블, 버튼)
4. 시그널(이벤트) 처리방법
5. QtDesigner로 화면 디자인, PyQt와 연동

<img src="../image/db006.png" width = "600">

#### Oracle 연동 GUI 개발 시작
- 오라클 Python 연동 DB(스키마) 생성
- Student 테이블 생성
    ```sql
    -- sys(sysdba)로 작업

    -- madang 스키마, 사용자 생성
    CREATE USER madang IDENTIFIED BY madang;

    -- 권한 설정
    GRANT CONNECT, resource TO madang;

    -- madang으로 사용 스키마 변경

    -- 테이블 Student 생성
    CREATE TABLE students(
        std_id 		NUMBER 			PRIMARY KEY,
        std_name 	varchar2(100) 	NOT NULL,
        std_mobile  varchar2(15) 	NULL,
        std_regyear NUMBER(4,0)		NOT NULL
    );

    -- Students용 시퀀스 생성
    CREATE SEQUENCE SEQ_student
    INCREMENT BY 1
    START WITH 1;
    ```
- Student 테이블 생성, 더미데이터 추가
```sql
-- madang 로그인

-- 조회
    SELECT *
    FROM Students;

    -- 더미데이터 삽입
    INSERT INTO Students (std_id, std_name, std_mobile, std_regyear)
    VALUES (seq_student.nextval, '홍길동','010-9999-8888', 1997);

    INSERT INTO Students (std_id, std_name, std_mobile, std_regyear)
    VALUES (seq_student.nextval, '홍길순','010-9999-8877', 2000);

    commit;
```
- Python 오라클 연동 테스트
    - 오라클 모듈
        - oracledb : oracle 최신버전에 매칭
        - **cx_Oracle** : 구버전까지 잘 됨
        
        - [Microsoft C++ BUild Tools](https://visualsutudio.microsoft.com/ko/visual-cpp-build-tools/) 필요
            - Visual Studio Installer 실행
            - 개별 구성요소에서 아래 요소 선택
            - [x] MSVC v1xx -VS 20XX C++ x64/x86
            - [x] C++ CMake Tools for Window
            - [x] Windows 10 SDK(10.0.xxxxx)
        - 설치
    - 콘솔에서 '> pip install cx_Oracle' 
    - 콘솔 오라클 연동 : [python](./)
        - DPI-1047 오류 발생
        - 64bit Oracle Client Library가 OS에 설치되지 않았기 때문에 오류 발생
        - 사이트에서 버전에 맞는 Oracle Client를 다운로드
            - https://www.oracle.com/kr/database/technologies/instant-client/winx64-64-downloads.html
        - 11g 다운로드
        - 압축해제(""C:\Users\Admin\Documents\카카오톡 받은 파일\instantclient-basic-windows.x64-11.2.0.4.0.zip""), 시스템 정보 path 등록
        - 재부팅~!
    - 콘솔 테스트 결과
        <img src="../image/db008.png" width = "600">


- QtDesigner로 화면 구성
    
- PyQt로 Oracle 연동 CRUD 구현
