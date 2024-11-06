--본인이 다른 사람의 관리자(manager_id)로 되어 있는 직원의 사번, 이름, 직책, 부서번호를 나타내시오.

SELECT ID 사번, NAME 이름, TITLE 직책, DEPT_ID 부서번호
FROM S_EMP OUTER
WHERE EXISTS(SELECT MANAGER_ID
                FROM S_EMP
                WHERE MANAGER_ID = OUTER.ID);

-- 위 아래 같은 쿼리 --

SELECT ID, NAME, TITLE, DEPT_ID
FROM S_EMP OUTER
WHERE EXISTS (SELECT ID
              FROM S_EMP
              WHERE MANAGER_ID = OUTER.ID);
              
--질의결과
--사번, 이름, 직책, 부서번호
--1	박구곤	사장	118
--2	손명성	기획부장	110
--15	신종필	영업대표이사	106

SELECT A.ID
FROM S_EMP A, S_EMP B
WHERE B.MANAGER_ID = A.ID;

SELECT * FROM S_EMP;