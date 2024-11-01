/* S_EMP 테이블에서 이름은 홍길동, 급여는 2000, 나머지는 NULL을 입력하되,(INSERT)
사번은 SEQUENCE 값(SEQUENCE.NEXTVAL, SEQUENCE.CURRVAL)을 이용하시오. */
-- 1. 시퀀스 생성 -> 2. 시퀀스 사용

--CREATE SEQUENCE S_EMP_ID
--        INCREMENT BY 1
--        START WITH 1
--        MAXVALUE 20
--        NOCYCLE
--        NOCACHE

--SELECT * FROM ALL_SEQUENCES
--WHERE SEQUENCE_NAME = 'S_EMP_ID';

--질의결과
--C##STUDENT	S_EMP_ID	1	20	1	N	N	0	1	N	N	N	N	N

--DROP SEQUENCE S_EMP_ID
--CREATE SEQUENCE S_EMP_ID
--        INCREMENT BY 1
--        START WITH 26
--        MAXVALUE 46
--        NOCYCLE
--        NOCACHE

INSERT INTO S_EMP (ID, NAME, SALARY)
            VALUES (S_EMP_ID.NEXTVAL, '홍길동', 2000);
            
SELECT * FROM S_EMP
WHERE NAME = '홍길동';

DESC S_EMP;