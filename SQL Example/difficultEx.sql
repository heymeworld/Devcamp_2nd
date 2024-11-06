/* 1. 각 부서(DEPT_ID)의 평균(AVG(SALARY))을 구하되
평균 급여가 2000 이상인(AVG(SALARY) >= 2000) 부서만 나타내는 SELECT문을 작성하시오  */
SELECT DEPT_ID, ROUND(AVG(SALARY),2) 평균급여2000이상
FROM S_EMP
GROUP BY DEPT_ID
HAVING AVG(SALARY) >= 2000;

/* 2. 각 직책(TITLE) 별로 급여(SALARY)의 총합(SUM)을 구하되 직책이 사원인 사람은 제외하시오. (TITLE != '사원')
단, 급여총합이 3000이상인(SUM >= 3000) 직책만 나타내며, 급여 총합에 대한 내림차순으로 정렬하시오 (ORDER BY SUM DESC)*/
SELECT TITLE, SUM(SALARY) 급여총합
FROM S_EMP
WHERE TITLE != '사원'
GROUP BY TITLE
HAVING SUM(SALARY) >= 3000
ORDER BY SUM(SALARY) DESC;

/* 3. 직급(TITLE)이 '부장'인 사람이(COUNT(TITLE LIKE '%부장')) 2명 이하인(COUNT <= 2)
부서(DEPT_ID)가 몇개인지(DEPT_ID, COUNT(*)) 나타내는 SELECT 문을 작성하시오. */
SELECT COUNT(*) 부장인원        --> 부서수가 총 11개고, 부장 2명 이하 부서가 전부인데,, 4개 밖에 안 나옴...
FROM (SELECT DEPT_ID, COUNT(*) --> 0도 카운트해야 한다
        FROM S_EMP
        WHERE TITLE LIKE '%부장'
        GROUP BY DEPT_ID
        HAVING COUNT(*) <=2);


SELECT DEPT_ID, COUNT(*)                --> 부장이 없는 부서    
FROM S_EMP
WHERE DEPT_ID NOT IN (SELECT DEPT_ID
                        FROM S_EMP
                        WHERE TITLE LIKE '%부장'
                        GROUP BY DEPT_ID)
GROUP BY DEPT_ID;

SELECT DEPT_ID
FROM s_emp
WHERE TITLE LIKE '%부장'
GROUP BY DEPT_ID
HAVING COUNT(*) <= 2

UNION ALL

SELECT DEPT_ID
FROM s_emp
GROUP BY DEPT_ID
HAVING COUNT(CASE WHEN TITLE LIKE '%부장' THEN 1 END) = 0;

/* 4. 담당직원(SALES_REP_ID)이 배정되지 않은 고객(NAME)을 모두 나타내는 SELECT 문을 작성하시오. */
SELECT NAME
FROM S_CUSTOMER C
WHERE SALES_REP_ID = 0;


/* 8. 전체 임직원 중에서 연봉이 제일 높은 사람 3명의 이름(NAME)과 연봉(SALARY)을 출력하는 문장을 작성하시오. */
SELECT NAME, SALARY, RANK() OVER (ORDER BY SALARY DESC) 연봉순위
FROM S_EMP
WHERE ROWNUM <= 3;

/* 아래 부정문이 사용되어 비효율적인 SQL문을 NOT EXISTS를 사용해서 효율적으로 작성하시오.
(S_EMP.TITLE에 인덱스가 작성되어 있다고 가정) */
SELECT ID, NAME, TITLE
FROM S_EMP
WHERE TITLE <> '사원';

-- 부정 표현식에서 긍정 표현식으로 바꿈
SELECT ID, NAME, TITLE
FROM S_EMP E
WHERE NOT EXISTS (SELECT 1
                    FROM S_EMP
                    WHERE E.TITLE = '사원');                