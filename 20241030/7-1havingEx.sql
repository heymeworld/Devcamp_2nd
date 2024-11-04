/* 각 직책별(title)로 급여의 총합(sum(salary))을 구하되 직책이 부장인 사람(title='부장')은 제외하시오.
단, 급여총합이 8000(만원) 이상(sum >= 8000)인 직책만 나타내며, 
급여 총합에 대한 오름차순(order by asc)으로 정렬하시오. */

SELECT TITLE, SUM(SALARY) 급여총합
FROM S_EMP
WHERE TITLE NOT LIKE '%부장'
GROUP BY TITLE
HAVING SUM(SALARY)>= 8000
ORDER BY SUM(SALARY) ASC;

--질의결과
--TITLE, 급여총합
-- 사원	8090
-- 과장	11500