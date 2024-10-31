/* 가장 적은(MIN) 평균급여(AVG(SALARY))를 받는 직책(TITLE)에 대해
그 직책(TITLE)과 평균급여(AVG(SALARY))를 나타내시오 */

SELECT TITLE, AVG(SALARY) "가장 적은 평균급여"
FROM S_EMP
GROUP BY TITLE
HAVING AVG(SALARY) = (SELECT MIN(AVG(SALARY))
                        FROM S_EMP
                        GROUP BY TITLE);
                        
--질의결과
--TITLE 가장 적은 평균급여
--사원	809