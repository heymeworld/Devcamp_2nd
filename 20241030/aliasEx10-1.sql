/* 서울 지역에 근무하는(S_DEPT.REGION_ID = 1) 사원에 대해
각 사원의 이름(S_EMP.NAME)과 근무하는 부서명(S_DEPT.NAME)을 나타내시오.
(S_EMP.DEPT_ID = S_DEPT.ID) */

SELECT E.NAME 사원명, E.DEPT_ID, D.NAME 부서명
FROM S_EMP E, S_DEPT D
WHERE E.DEPT_ID = D.ID AND D.REGION_ID = 1;

--질의결과
--사원명, DEPT_ID, 부서명
--박구곤	118	인사부
--손명성	110	기획부
--이은선	102	영업부
--서의홍	101	총무부
--김심선	118	인사부
--전지영	110	기획부
--최정선	102	영업부
--이기철	110	기획부
--구원상	110	기획부