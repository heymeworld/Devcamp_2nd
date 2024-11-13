-- 1. 직원 테이블(S_EMP)의 모든 행을 삭제하는 문장을 적으시오.
DELETE FROM S_EMP;
SELECT * FROM S_EMP;

-- 2. 직원 테이블에 존재하는 모든 직급(TITLE)을 중복없이 출력하시오.
SELECT DISTINCT TITLE FROM S_EMP;

-- 3. 직원 테이블을 부서별(DEPT_ID) 내림차순, 연봉(SALARY) 오름차순으로 정렬하시오.
SELECT * FROM S_EMP
ORDER BY DEPT_ID DESC, SALARY;

-- 4. 직원 테이블에서 2015년도 이전에 입사한 직원의 수를 출력하시오.
SELECT * FROM S_EMP
WHERE START_DATE < TO_CHAR('15/01/01');

-- 5. 연봉이 1000 이상 5000 이하인 직원을 모두 출력하시오.
SELECT * FROM S_EMP
WHERE SALARY BETWEEN 1000 AND 5000;

-- 6. 각 부서(DEPT_ID)별 평균 급여를 계산해서 보여주시오.
SELECT DEPT_ID, ROUND(AVG(SALARY), 2)
FROM S_EMP
GROUP BY DEPT_ID;

-- 7. 각 부서(DEPT_ID)별로 직책이 사원인 직원들의 평균 급여를 계산해서 보여주시오.
SELECT DEPT_ID, AVG(SALARY)
FROM S_EMP
WHERE TITLE = '사원'
GROUP BY DEPT_ID;

-- 8. 각 지역(REGION_ID)별로 몇 개의 부서가 있는지를 나타내시오.
SELECT REGION_ID, COUNT(*)
FROM S_DEPT
GROUP BY REGION_ID;

-- 9. 각 부서별로 평균 급여를 구하되 평균 급여가 2000 이상인 부서만 나타내시오.
SELECT DEPT_ID, ROUND(AVG(SALARY), 2)
FROM S_EMP
GROUP BY DEPT_ID
HAVING AVG(SALARY) >= 2000;

/* 10. 각 직책별로 급여의 총합을 구하되 직책이 부장인 사람은 제외하시오.
단, 급여총합이 8000(만원) 이상인 직책만 나타내며, 급여 총합에 대한 오름차순으로 정렬하시오. */
SELECT TITLE, SUM(SALARY)
FROM S_EMP
WHERE TITLE NOT LIKE '%부장'
GROUP BY TITLE
HAVING SUM(SALARY) >= 8000
ORDER BY SUM(SALARY);

-- 11. 각 부서별로 직책이 사원인 직원들에 대해서만 평균급여를 구하시오.
SELECT DEPT_ID, AVG(SALARY)
FROM S_EMP
WHERE TITLE = '사원'
GROUP BY DEPT_ID;

-- 12. 각 부서내에서 각 직책별로 몇 명의 인원이 있는지를 나타내시오.
SELECT *
FROM S_EMP
ORDER BY DEPT_ID, TITLE;

SELECT DEPT_ID, TITLE, COUNT(*)
FROM S_EMP
GROUP BY DEPT_ID, TITLE
ORDER BY DEPT_ID;

-- 13. 각 부서내에서 몇 명의 직원이 근무하는지를 나타내시오.
SELECT DEPT_ID, COUNT(*)
FROM S_EMP
GROUP BY DEPT_ID;

/* 14. 각 부서별로 급여의 최소값과 최대값을 나타내시오.
단, 최소값과 최대값이 같은 부서는 출력하시지 마시오. */
SELECT DEPT_ID, MIN(SALARY), MAX(SALARY)
FROM S_EMP
GROUP BY DEPT_ID
HAVING MIN(SALARY) != MAX(SALARY);

SELECT DEPT_ID, MIN(SALARY), MAX(SALARY)
FROM S_EMP
GROUP BY DEPT_ID
HAVING MIN(SALARY) <> MAX(SALARY);

/* 15. 직원(S_EMP) 테이블과 부서(S_DEPT) 테이블을 JOIN하여,
사원의 이름과 부서번호, 부서명을 나타내시오. */
SELECT E.NAME, E.DEPT_ID, D.NAME
FROM S_EMP E, S_DEPT D
WHERE E.DEPT_ID = D.ID
ORDER BY DEPT_ID;

-- 16. 서울 지역에 근무하는 사원에 대해 각 사원의 이름과 근무하는 부서명을 나타내시오.
SELECT E.NAME, D.NAME, D.REGION_ID
FROM S_EMP E, S_DEPT D
WHERE E.DEPT_ID = D.ID AND D.REGION_ID = 1
ORDER BY D.NAME;

/* 17. 직원 테이블(S_EMP)과 급여 테이블(SALGRADE)을 JOIN 하여
사원의 이름과 급여, 그리고 해당 급여등급을 나타내시오. */
SELECT E.NAME, E.SALARY, G.GRADE
FROM S_EMP E, SALGRADE G
WHERE SALARY BETWEEN G.LOSAL AND G.HISAL;

/* 18. 직원(S_EMP) 테이블과 고객(S_CUSTOMER) 테이블에서
사원의 이름과 사번, 그리고 각 사원의 담당 고객 이름을 나타내시오.
단, 고객에 대하여 담당 영업사원이 없더라도 모든 고객의 이름을 나타내고, --> 사원쪽 데이터가 부족하더라도 또는, 고객 데이터를 기준으로!
사번 순으로 오름차순 정렬하시오. */
-- outer join 시, on 으로 조건을 적용시켜야 원하는 결과를 얻을 수 있다.
SELECT E.ID, E.NAME, C.NAME
FROM S_EMP E RIGHT OUTER JOIN S_CUSTOMER C
ON E.ID = C.SALES_REP_ID
ORDER BY E.ID;

/* 19. 직원 중에 '김정미'와 같은 직책(TITLE)을 가지는 (김정미만 나오는 테이블)
사원의 이름과 직책, 급여, 부서번호를 나타내시오. (SELF JOIN을 사용할 것) */
SELECT A.NAME, A.TITLE, A.DEPT_ID, A.SALARY
FROM S_EMP A JOIN S_EMP B
ON B.NAME = '김정미'
WHERE A.TITLE = B.TITLE;

-- 20. 가장 적은 평균 급여를 받는 직책에 대해 그 직책과 평균급여를 나타내시오.
SELECT TITLE, AVG(SALARY)
FROM S_EMP
GROUP BY TITLE
HAVING AVG(SALARY) = (SELECT MIN(AVG(SALARY))
                      FROM S_EMP
                      GROUP BY TITLE);
                      
/* 21. S_EMP 테이블에서 각 사원의 이름과 급여, 급여등급을 나타내시오.
급여가 4000만원 이상이면 A, 3000만원 이상이면 B, 2000만원 이상이면 C,
1000만원 이상이면 D, 0만원 이상이면 E등급으로 나타내시오.
(SALGRADE 테이블을 사용하지 않고 DECODE()를 사용할 것) */
SELECT NAME, SALARY, DECODE(TRUNC(SALARY/1000), 0, 'E',
                                                1, 'D',
                                                2, 'C',
                                                3, 'B',
                                                   'A') 급여등급
FROM S_EMP;

-- 22. 자신의 급여가 자신이 속한 부서의 평균 급여보다 적은 직원에 대해 이름, 급여, 부서번호를 출력하시오.

SELECT NAME, DEPT_ID, SALARY
FROM S_EMP OUTER
WHERE SALARY < (SELECT AVG(SALARY)
                FROM S_EMP
                WHERE DEPT_ID = OUTER.DEPT_ID)
ORDER BY DEPT_ID;
--> 이렇게 단일행과 다중행을 비교하고 싶다면, 행을 다중 -> 단일로 만들 순 없으니까
--> 단일행과 다중행을 1:1로 대응할 수 있는 조건을 걸어주면 된다(그룹화와 비슷)
--> 심지어 위 서브쿼리는 GROUP BY 를 안 썼다. 조건절로 대신 그룹화를 하면서 매칭시켜줬다고 보면 된다

/* 23. 본인의 급여가 각 부서별 평균 급여 중 어느 한 부서의 평균급여보다 적은 급여를 받는 직원에 대해
이름, 급여, 부서번호를 출력하시오.(ANY를 사용할 것) */
SELECT NAME, DEPT_ID, SALARY
FROM S_EMP
WHERE SALARY < ANY(SELECT AVG(SALARY)
                FROM S_EMP
                GROUP BY DEPT_ID)
ORDER BY DEPT_ID;

/* 24. 본인이 다른 사람의 관리자(MANAGER_ID)로 되어 있는 직원의 사번, 이름, 직책, 부서번호를 나타내시오.(EXISTS 사용할 것) */
SELECT ID, NAME, TITLE, DEPT_ID
FROM S_EMP OUTER
WHERE EXISTS (SELECT ID
              FROM S_EMP
              WHERE MANAGER_ID = OUTER.ID);

-- 25. 직원(S_EMP) 테이블에서 이름을 사전순으로 정렬하여 5개의 데이터만 나타내시오.
-- 예상결과
--강연범
--구원상
--김석우
--김심선
--김정미

SELECT NAME
FROM S_EMP
WHERE ROWNUM <= 5
ORDER BY NAME;