/* 각 지역(REGION_ID)별로 몇 개의(COUNT(부서명)) 부서가 있는지를 나타내시오. */

SELECT REGION_ID, COUNT(NAME) 부서수
FROM S_DEPT
GROUP BY REGION_ID;

--질의결과
--부서수
--1	4
--2	2
--3	2
--4	2
--5	1