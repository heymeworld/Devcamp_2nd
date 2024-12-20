/* 각 부서(dept_id)별 평균 급여(avg(sal)를 계산해서 보여주시오. */
-- BETTER QUERY
SELECT DEPT_ID, ROUND(AVG(SALARY), 2) 평균급여
FROM S_EMP
GROUP BY DEPT_ID;

--질의결과
--DEPT_ID, 평균급여
-- 118	4100
-- 110	1585
-- 102	2975
-- 101	3000
-- 111	1465
-- 112	1233.33
-- 113	1472
-- 103	0
-- 104	2650
-- 105	0
-- 106	397.5


SELECT dept_id, avg(salary) 평균급여 from s_emp
group by dept_id;

--질의결과
--dept_id, 평균급여
--118	4100
--110	1585
--102	2975
--101	3000
--111	1465
--112	1233.333333333333333333333333333333333333
--113	1472
--103	0
--104	2650
--105	0
--106	397.5