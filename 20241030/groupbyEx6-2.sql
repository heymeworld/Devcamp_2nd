/* 각 부서별(DEPT_ID)로 평균 급여(AVG(SAL))를 구하되 평균 급여가 
2000이상인((AVG(SAL)) >=2000) 부서만 나타내시오. */

SELECT DEPT_ID, AVG(SALARY) 평균급여 
FROM S_EMP
GROUP BY DEPT_ID
HAVING AVG(SALARY) >= 2000;

--질의결과
--DEPT_ID, 평균급여 
--118	4100
--102	2975
--101	3000
--104	2650