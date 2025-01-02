-- DQL => SELECT
/*
	emp : 사원 정보
	 = empno : 사번 ===========> 기본키 (중복이 없다)
	 						   ------------------------
							   수정 / 삭제 / 상세보기 => 주로 사용
							   정수형
	 = ename : 이름		문자열
	 = job : 직위		문자열
	 = mgr : 사수 사번	정수
	 = hiredate : 입사일	날짜형
	 = sal : 급여		정수 => 설정 실수
	 = comm : 성과급	정수
	 = deptno : 부서번호 	정수 ===> dept테이블과 JOIN
	
*/
--1. KING은 직위가 XXX이다 => 문자열 결합 => 문자열, 날짜는 ''안에서 사용
/*SELECT ename||'은 직위가 '||job||'이다'
FROM emp;*/
/*
	1. 형식 => 순서
	2. 날짜, 문자열 => "을 사용한다
	3. ""는 보통 => 별칭사용시에 주로 사용
	4. 중복없는 데이터 DISTINCT 컬럼
	5. 문자열 결합 => ||
	6. 문장이 종료되면 ;을 사용
	7. table에 어떤 컬럼을 가지고 있는지 / 어떤 데이터가 추가되었는지
	   DESC table명
	   컬럼명 데이터형
*/
-- 화면에 필요한 데이터 추출
-- 검색 결과 / 상세보기 / 목록 ... 
-- 연산자 => WHERE (if) 
-- 149page
/*
	1. 산술연산자 : SELECT 뒤에서 사용
			     +,-,*,/ => %(MOD 함수)
			    => 순수하게 숫자만 처리
			    => / => 정수/정수=실수
			    => WHERE에서는 사용하지 않는다 
			   => 통계/평균
			    
	2. 비교연산자 : => WHERE뒤에 사용
				같다 ====> = (오라클: =, Java:==, 자바스크립트 : ===)
				같지 않다 : !=, <>(권장사항), ^=
				크다	: >
				작다 : <
				크거나 같다 : >=
				작거나 같다 : <=
				--------------------
				SELECT ~ 
				FROM table명
				WHERE 조건문 => 조건문이 true일 경우에 실행
				---------------------
					조건문 사용 방법
					-------------------
					WHERE 컬럼명 연산자 값
							     -------- --
									문자 / 날짜는 반드시..
							     산술연산자 외 모두	
	3. 논리연산자
		직렬연산자 => AND (& => 입력) => 범위 포함, 기간 포함
		병렬연산자 => OR (|| => 문자열 결합) => 범위 밖, 기간 밖
				=> IN
			(조건) AND (조건)
			------		-------
			   |		   |
			  ---------------
				  |
				결과값 => 좌우의 조건이 true일 때만 true =>  나머지 false

			(조건) OR (조건)
			-------      -------
			    |		   |
			    --------------
				   |
				결과값 => 좌우의 조건이 false일때만 false => 나머지는 true
	4. 대입연산자
		= : WHERE문장 뒤에서는 같다
		     UPDATE
		      	name='A'
-------------------------------------
	5. IN
	6. NOT
	7. NULL
	8. BETWEEN
	9. LIKE
------------------------------- 데이터베이스에서만 사용
*/
-- 산술연산자 => 클래스 설계와 동일
/*CREATE TABLE student(
	hakbun NUMBER(4),
	name VARCHAR2(51),
	kor NUMBER(3),
	eng NUMBER(3),
	math NUMBER(3),
);*/
/*
insert into student VALUES(1,'홍길동',90,80,78);
insert into student VALUES(2,'심청이',80,78,75);
insert into student VALUES(3,'박문수',90,80,78);
insert into student VALUES(4,'이순신',90,80,78);
insert into student VALUES(5,'강감찬',90,80,78);
commit;
*/
-- 산술연산자
-- +, /
--SELECT hakbun, name, kor, eng, math, (kor+eng+math) "total", (kor+eng+math)/3 "avg" FROM student;
-- emp 테이블에서 사원의 이름과 연봉을 출력
-- SELECT ename "이름", sal*12 "연봉" from emp;
-- WHERE 조건문(true/false)
-- emp 테이블에서 급여가 3000인 사원의 이름, 입사일, 급여 출력
/*SELECT ename, hiredate, sal
FROM emp
WHERE sal=3000;*/
-- emp 테이블에서 급여가 1500이하인 사원의 이름, 입사일, 급여 출력
--select ename, hiredate, sal from emp where sal<=1500;
-- 학생 테이블에서 총점이 230 이상인 학생의 이름, 총점을 출력
--select name, (eng+math+kor) "total" from student where 230<=(eng+math+kor);

-- emp테이블에서 job이 MANAGER가 아닌 사원의 이름, 직위, 입사일을 출력

--sect ename, job, hiredate from emp where job!='MANAGER';
--문자열 => "이용한다, 실제 저장된 데이터는 대소문자를 구분한다
-- emp에 저장된 문자열은 모두 대문자로 되어 있다.
--select ename, job, hiredate from emp where job^'MANAGER';                       
--오라클 단점 : 같은 출력 => SQL문장이 여러개 있다 => 정답은 없다
-- 빠른 검색 => <>, !=, ^=
-- 81년 11월 17일에 입사한 사원의 이름과 입사일을 출력
--SELECT ename, hiredate FROM emp WHERE hiredate='81/11/17';
---날짜를 처리 => 반드시 ''을 이용한다
--SELECT ename, job,hiredate, sal FROM emp WHERE empno=&sabun;
/*
	데이터유형
	   => 숫자 / 문자열 / 날짜 / null
					     ------- 데이터가 존재하지 않는 상태
					     ------- 연산처리가 안된다 (결과값 : null)
*/
-- 사원(emp) 테이블에서 총 월급 수령액을 출력 
-- sal(급여), 성과급 (comm)
SELECT ename, sal, sal+NVL(comm,0) FROM emp;
