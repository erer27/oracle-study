/*

=> SELECT 순서
    ** SELECT 데이터 검색
        1. 컬럼으로도 사용이 가능 => 스칼라 서브쿼리
        2. 테이블 대신 사용이 가능 => 인라인뷰
        3. WHERE 문장에서도 사용이 가능 => 서브쿼리
        ** GROUP BY : 그룹별 처리
        ** JOIN : 테이블 여러개 연결
        ** SubQuery : SQL안에 SQL을 첨부해서 처리
        
        SELECT * | column_list
        FROM table명 => view명 | SELECT
                            ------------- 서브쿼리 / 인라인뷰
        [
            WHERE 조건문 : 연산자
            GROUP BY 그룹컬럼|함수
            HAVING 그룹 조건 => 집계집합을 주로 이용한다
            ORDER BY 그룹컬럼|함수
        ]
        => 연산자 / 내장함수
        
    -문제 1
    아래의 쿼리 결과를 출력하시오
     1. 출력 => ename / job / sal
     2. 정렬 => job, sal
     SELECT ename,job,sal
     FROM emp
     ORDER BY 2,3
     
     => 오라클의 데이터형
        문자형 : CHAR / VARCHAR2 / CLOB => String
        숫자형 : NUMBER => int / double
                ------ 38자리
                지정하지 않는 경우 => NUMBER
                                    ------
                                    NUMBER(8,2)
        날짜형 : DATE / TIMESTAMP
        --------------------------------------------
        
        => 문자형 / 날짜형 => '값'
        => DESC table명
            ------------ 구조 확인
        => || => 문자열 결합
        => DISTINCT => 중복없는 데이터 출력
        => SQL문장 종료 => ;
                        ----
                        자바에서는 자동으로 처리
                                --------------
                                | ;
                                | AutoCommit()
                                
     -문제 2
     SELECT ename||'의 연봉은 '||(sal*12)||'입니다'
     FROM emp
     ORDER BY (sal*12) DESC;
     
     
     -문장 3
     
     SELECT UPPER(ename),LOWER(job), INITCAP(ename)
    FROM emp;
            
            
     => 함수
     => 오라클에서 지원하는 함수
     단일행 함수 : ROW => 한줄씩 처리
        문자함수
            LENGTH(문자|컬럼명) => 문자의 개수 (한글포함)
             예) LENGTH('abc') => 3
                LENGTH('홍길동') => 3
                => 비밀번호 개수 : 8~15
                => RPAD
            SUBSRT(문자|컬럼명,시작번호,자르는 개수)
                            ----------- 1번부터, 뒤에서 -1번부터
            INSTR(문자|컬럼명,찾는문자,시작번호,몇번째?)
                                    --------
                                    양수 => indexOf
                                    음수 => lastIndexOf
            RPAD : 지정된 문자갯수만큼 출력
                    => 남으면 => 문자가 잘린다
                    => 모자라면 => 지정된 문자 출력
            예) RPAD('ABC',5,'#') => ABC##
                RPAD('ABCDEF',5,'#') => ABCDE
            => CONCAT => 문자열 결합 => ||
                MYSQL/MARIADB => LIKE CONCAT('%','문자열','%')
                ORACLE => LIKE '%' || '문자열' || '%'
                ---------------------------------------------
                WHERE REGEXP_LIKE(ename,'')
        숫자함수
            CELL => 올림 => 소수점이 1이상이면 => 올린다
                => 총페이지 구하기
            예) CEIL(4.1) => 5
            ROUND => 반올림 => 소수점이 5이상이면 => 올린다
                        =>평균
            예) ROUND(10.567,2) => 10.58
                         -
            TRUNC => 버림 => 소수점은 상관없다
            예) TRUNC(10.567,2) => 10.56 => 퇴직금 / 날짜
                날짜 => 시간/분/초 => 날수 (소수점으로 출력)
        날짜함수
            SYSDATE : 시스템 날짜 / 시간 => 많이 사용
            MONTHS_BETWEEN : 기간의 개월수 가지고 온다
                MONTHS_BETWEEN(현재,과거)
                            SYSDATE, hiredate
            ADD_MONTHS => 날짜+개월 => 지정된 날짜 출력
                => 적금 / 보험 / 수료 / 졸업 
                => 회원가입 => 로그인 (6개월이 지나면 휴면계정)
        변환함수
            TO_CHAR : 문자열 변환
                날짜변환
                    YYYY/RRRR
                    MM
                    DD
                    HH HH24
                    MI
                    SS
                    DY => 요일
                숫자변환
                    $999,999
                    L999,999
            TO_DATE : 날짜형으로 변환 => 예약/체크인
        기타함수
            NVL() => null값을 대체
            NVL(컬럼명, 대체값)
              -----    -----
                |        |
                ---------- 데이터형 일치 => 많이 등장
                
     집계함수(집합함수) : Column단위 => 통계
            SUM(컬럼명) : 전체 컬럼의 합 => 장바구니 (구매 총계산)
            AVG(컬럼명) : 전체의 평균
            MIX/MAX : 최소, 최대값
            ***COUNT : 총 개수 (지상)
            GROUP BY => ROLLUP / CUBE => 가로 세로 통계 
            
            
            
    문제 4
    SELECT ename, sal
    FROM emp
    WHERE ename=UPPER('scott')
    -- 저장된 데이터는 대소문자 구분
    
    
    문제5
    SELECT ename, SUBSTR(ename,1,3) "SUBSTR"
    FROM emp;
    
    
    문제6
    SELECT LOWER(SUBSTR(ename,1,1) from emp;
    
    문제7
    SELECT UPPER(SUBSTR(ename,1,1))||LOWER(SUBSTR(ename,2,LENGTH(ename)-1))
    FROM emp;

    문제8
    => LIKE 검색
        시작문자 => '문자%'
        끝나는 문자 => '%문자'
        포함 문자 => '%문자%'
        글자수 지정 => '__'
        
        SELECT ename,sal
        FROM emp
        WHERE ename LIKE '%M%';

        SELECT ename,sal
        FROM emp
        WHERE REGEXP_LIKE(ename, 'M');
        
        ^M => M%    %R=>R$  %M% => M
        
    
    문제9
    SELECT ename, hiredate
    FROM emp
    WHERE ename LIKE '%EN%' OR ename LIKE '%IN%'
    ORDER BY hiredate DESC;
    
    SELECT ename, hiredate
    FROM emp
    WHERE REGEXP_LIKE(ename,'IN|EN') => ^[] => NOT
    ORDER BY hiredate DESC;
    
    => ^ => 시작
    => $ => 끝
    => | => OR
    => 정규식
    
    
    문제 10
    SELECT ename, job
    FROM emp
    WHERE job='SALESMAN'
    ORDER BY sal DESC;
    
    
    문제 11
    SELECT ename, sal, job
    FROM emp
    WHERE ename LIKE 'A%';
    
    SELECT ename, sal, job
    FROM emp
    WHERE REGEXP_LIKE(ename,'^A');
    
    
    문제 12
    SELECT ename, sal, hiredate
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000
    ORDER BY hiredate ASC;
    
    
    문제13
    SELECT ename, hiredate
    FROM emp
    WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
    
    SELECT ename, hiredate
    FROm emp
    WHERE hiredate LIKE '81%';
    
    SELECT ename, hiredate
    FROM emp
    WHERE SUBSTR(hiredate,1,2)=81;
    
    SELECT ename, hiredate
    FROM emp
    WHERE TO_CHAR(hiredate,'YYYY')=1981;


    문제15
    SELECT ename
    FROM emp
    WHERE INSTR(ename,'A')>0;
    
    
    
    문제16
    insert into emp(empno, ename, sal) values(1238, 'JACK    ', 4000);
    SELECT RTRIM(ename), sal
    FROM emp
    WHERE RTRIM(ename)='JACK';
    
    DELETE FROM emp
    WHERE empno=1238;
    COMMIT;
    
    
    문제 17
    SELECT RPAD(sal,10,'*')
    FROM emp;
    
    
    문제 18
    SELECT LPAD(sal)
    
    
    
    문제 19
    SELECT ename, LENGTH(ename)
    FROM emp;
    
    
    
    문제 20
    SELECT ename, ROUND(SYSDATE-hiredate)
    FROM emp;
    
    
    문제 21
    SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) "근무개월수"
    FROM emp;
    
    
    문제 22
    SELECT ADD_MONTHS(SYSDATE,100)
    FROM DUAL;


    
    문제 23
    SELECT NEXT_DAY(SYSDATE, '월')
    FROM DUAL;
    
    
    문제 24
    
    
    문제 25
    SELECT LAST_DAY(SYSDATE)
    FROM DUAL;
    
    
    
    문제 26
    SELECT LAST_DAY(SYSDATE)-SYSDATE
    FROM DUAL;
    
    
    문제 27
    SELECT TO_CHAR(SYSDATE, 'DY')||'요일'
    FROM DUAL;
    
    
    문제 28
    SELECT ename, TO_CHAR(hiredate, 'DAY')
    FROM emp;
    
    
    문제 29
    
    
    문제 30
    SELECT ename, TO_CHAR(hiredate,'RRRR')
    FROM emp;
    
    
    문제 32
    SELECT ename, hiredate, TO_CHAR(hiredate, 'DAY')
    FROM emp
    WHERE TO_CHAR(hiredate, 'DAY')='목요일';
    
    문제33
    SELECT ename,hiredate
    FROM emp
    WHERE TO_CHAR(hiredate,'YY"년" MM"월" DD"일"')='81년 12월 11일';
    
    
    문제34
    SELECT ename, TO_CHAR(sal,'L999,999') FROM emp;
    
    문제35
    SELECT ename, TO_CHAR(sal*5400, '999,999,999') FROM emp;
    
    
    문제 36
    SELECT ename, NVL(comm,0) FROM emp;
    
    
    
    
    
    
    
    
    
    
*/