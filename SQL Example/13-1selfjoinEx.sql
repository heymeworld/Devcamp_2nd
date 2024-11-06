/* 직원 중에 '김정미'와 같은 직책(TITLE)을 가지는 사원의 이름(NAME)과
직책(TITLE), 급여(SAL), 부서번호(DEPT_ID)를 나타내시오. (SELF JOIN을 사용할 것) */
-- JOIN만 쓰면, (INNER) JOIN이 DEFAULT
-- ON 조건절 : 어떤 테이블을 쓸 것이냐, 테이블을 조인하기 전에 조건으로 필터링해서 데려갈 수 있다

SELECT A.NAME, A.TITLE, A.salary, A.DEPT_ID
FROM S_EMP A JOIN S_EMP B
ON B.NAME = '김정미'
WHERE A.TITLE = B.TITLE;

SELECT NAME, TITLE, DEPT_ID, SALARY  --SubQUERY 사용
FROM S_EMP
WHERE TITLE = (SELECT TITLE
               FROM S_EMP
               WHERE NAME = '김정미');

-- 질의결과
-- 이름 직책 급여 부서번호
-- 전지영	과장	110	2400
-- 김정미	과장	111	2400
-- 신기웅	과장	112	2100
-- 이상헌	과장	113	2300
-- 최순철	과장	113	2300