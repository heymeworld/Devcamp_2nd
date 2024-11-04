/* 직원(S_EMP) 테이블과 고객(S_CUSTOMER)테이블에서
사원의 이름과 사번(S_EMP.NAME, S_EMP.ID), 그리고 각 사원의 담당고객 이름(S_CUSTOMER.NAME)을 나타내시오.
단, 고객에 대하여 담당영업사원이 없더라도(S_EMP.NAME = NULL) 모든 고객의 이름을 나타내고, (S_EMP (+))
사번 순으로 오름차순(ORDER BY S_EMP.ID ASC) 정렬하시오 */

SELECT E.NAME 사원명, E.ID, C.NAME 고객명
FROM S_EMP E, S_CUSTOMER C
WHERE E.ID (+) = C.SALES_REP_ID
ORDER BY 2;