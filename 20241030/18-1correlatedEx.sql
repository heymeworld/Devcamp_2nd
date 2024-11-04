/* 자신의 급여(SALARY)가 자신이 속한 부서의 평균 급여(AVG)보다 적은 직원에 대해
이름(NAME), 급여(SALARY), 부서번호(DEPT_ID)를 출력하시오 */

SELECT NAME, SALARY, DEPT_ID
FROM S_EMP OUTER
WHERE SALARY < (SELECT AVG(SALARY)
                FROM S_EMP
                WHERE DEPT_ID = OUTER.DEPT_ID);
                
--질의결과
--NAME, SALARY, DEPT_ID
--최정선	2450	102
--신종필	0	    106
--이기철	0	    110
--구원상	940	    110
--서정주	1200	111
--안창환	795	    118
--윤정숙	750	    112
--장현철	850	    112
--장혜숙	800	    113
--오은경	860	    113
--이용호	1100	113