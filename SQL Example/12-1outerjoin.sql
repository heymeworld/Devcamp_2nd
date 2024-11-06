/* 직원(S_EMP) 테이블과 고객(S_CUSTOMER)테이블에서
사원의 이름과 사번(S_EMP.NAME, S_EMP.ID), 그리고 각 사원의 담당고객 이름(S_CUSTOMER.NAME)을 나타내시오.
단, 고객에 대하여 담당영업사원이 없더라도(S_EMP.NAME = NULL) 모든 고객의 이름을 나타내고, (S_EMP (+))
사번 순으로 오름차순(ORDER BY S_EMP.ID ASC) 정렬하시오 */

SELECT E.ID 사번, E.NAME 사원명, C.NAME 담당고객  -- RIGHT OUTER JOIN 사용
FROM S_EMP E RIGHT OUTER JOIN S_CUSTOMER C     -- RIGHT : 데이터가 기준인 쪽으로 사용
ON E.ID = C.SALES_REP_ID
ORDER BY 1;

SELECT E.ID 사번, E.NAME 사원명, C.NAME 담당고객  -- JOIN 조건절 ON (+) 사용
FROM S_EMP E JOIN S_CUSTOMER C
ON E.ID (+) = C.SALES_REP_ID
ORDER BY 1;

SELECT E.NAME 사원명, E.ID, C.NAME 고객명        -- WHERE 절 (+) 사용
FROM S_EMP E, S_CUSTOMER C
WHERE E.ID (+) = C.SALES_REP_ID
ORDER BY 2;

-- 질의결과
-- 사번 사원명 담당고객
-- 11	최정선	전용호
-- 11	최정선	정태웅
-- 11	최정선	장혁
-- 11	최정선	노호현
-- 12	안은경	정진영
-- 12	안은경	신경화
-- 13	김석우	엄준식
-- 14	박성규	서용만
-- 14	박성규	정주영
-- 15	신종필	장창식
-- 15	신종필	최계윤
-- 15	신종필	한신동
-- 15	신종필	강원석
-- 15	신종필	김영철
-- (null)(null)고정환