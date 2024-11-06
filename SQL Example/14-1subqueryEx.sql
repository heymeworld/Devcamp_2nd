/* 가장 적은(MIN) 평균급여(AVG(SALARY))를 받는 직책(TITLE)에 대해
그 직책(TITLE)과 평균급여(AVG(SALARY))를 나타내시오 */

SELECT TITLE, AVG(SALARY) "가장 적은 평균급여"
FROM S_EMP
GROUP BY TITLE
HAVING AVG(SALARY) = (SELECT MIN(AVG(SALARY))  -- 다중행 함수를 사용한 SELECT 절에는 기본적으로 여러 행이 결과로 나올 수 있는 열을 함꼐 사용할 수 없다.
                        FROM S_EMP             -- 예를 들면, 'SELECT TITLE, MIN(~)' 을 하면, MIN 값은 한 행이 나오는 반면, TITLE 은 여러 행이 결과로 나오기 때문에 같이 사용 X
                        GROUP BY TITLE);       -- 그래서 메인 쿼리에서 'TITLE, MIN(AVG(SALARY))'을 사용하지 못한 것이다. 'MIN(AVG(SALARY)), COUNT(*)' 둘다 단일행은 가능
                        
--질의결과
--TITLE 가장 적은 평균급여
--사원	809