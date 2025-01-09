select * from book;

select * from orders;
-- 실제 이름, 책제목 => 조인 / 서브쿼리
select orderid, name, bookname, saleprice, orderdate
FROM orders,customer,book
WHERE orders.custid=customer.custid
AND orders.bookid=book.bookid;
-- 예약정보 / 구매 정보
SELECT orderid, 
        (SELECT name FROM customer WHERE custid=orders.custid) name, 
        (SELECT bookname FROM book WHERE bookid=orders.bookid) bookname, 
        saleprice, 
        orderdate
FROM orders;

-- 페이지 나누기
SELECT empno, ename, job, hiredate, sal, num
FROM (SELECT empno, ename, job, hiredate, sal, rownum as num 
            FROM (SELECT empno, ename, job, hiredate, sal
            FROM emp))
WHERE num BETWEEN 6 AND 10;

SELECT empno, ename, job, hiredate, sal, rownum
FROM (SELECT empno, ename, job, hiredate, sal
        FROM emp ORDER BY sal)
WHERE rownum BETWEEN 6 AND 10;

SELECT empno, ename, job, hiredate, sal, rownum as num
            FROM (SELECT empno, ename, job, hiredate, sal
            FROM emp ORDER BY sal DESC);

SELECT empno, ename, job, hiredate, sal, num
FROM (SELECT empno, ename, job, hiredate, sal, rownum as num
            FROM (SELECT empno, ename, job, hiredate, sal
            FROM emp ORDER BY sal DESC))
WHERE num BETWEEN 1 AND 5;

SELECT empno, ename, job, hiredate, sal, num
FROM (SELECT empno, ename, job, hiredate, sal, rownum as num
            FROM emp ORDER BY sal DESC)
WHERE num BETWEEN 6 AND 10;

SELECT empno, ename, job, hiredate, sal from emp order by sal desc;

SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);


select * from customer;
select * from book;
select * from orders;

Select count(*), sum(saleprice) from orders group by custid;

select custid, count(*) from orders where saleprice>=8000 group by custid;

select * from customer join orders on customer.custid=orders.custid;

select name, saleprice from customer join orders on customer.custid=orders.custid;

select name, nvl(saleprice,0) from customer left outer join orders on customer.custid=orders.custid;


