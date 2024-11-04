/* 직원 중에 '김정미'와 같은 직책(TITLE)을 가지는 사원의 이름(NAME)과
직책(TITLE), 급여(SAL), 부서번호(DEPT_ID)를 나타내시오. (SELF JOIN을 사용할 것) */
-- JOIN만 쓰면, (INNER) JOIN

SELECT A.NAME, A.TITLE, A.salary, A.DEPT_ID
FROM S_EMP A JOIN S_EMP B
ON B.NAME = '김정미'
WHERE A.TITLE = B.TITLE;