/* 직원 테이블(S_EMP)과 급여 테이블(SALGRADE)을 JOIN하여
사원의 이름(S_EMP.NAME)과 급여(SALGRADE.SALARY), 그리고 해당 급여등급(SALGRADE.GRADE)을 나타내시오. */

SELECT E.NAME 사원명, E.SALARY 급여, S.GRADE 급여등급
FROM S_EMP E, SALGRADE S
WHERE E.SALARY BETWEEN S.LOSAL AND S.HISAL;

-- 질의결과
-- 사원명 급여 급여등급
-- 박구곤	5000	A
-- 손명성	3000	B
-- 이은선	3500	B
-- 서의홍	3000	B
-- 김심선	3200	B
-- 전지영	2400	C
-- 김정미	2400	C
-- 신기웅	2100	C
-- 이상헌	2300	C
-- 최순철	2300	C
-- 최정선	2450	C
-- 김석우	2650	C
-- 서정주	1200	D
-- 이용호	1100	D
-- 구원상	940	E
-- 안창환	795	E
-- 윤정숙	750	E
-- 장현철	850	E
-- 장혜숙	800	E
-- 강연범	795	E
-- 오은경	860	E