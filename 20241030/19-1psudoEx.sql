--박구곤
--손명성
--이은선
--서의홍
--김심선

SELECT NAME, ROWNUM
FROM (SELECT * FROM S_EMP
       ORDER BY ID)
WHERE ROWNUM <= 5;

--NAME, ROWNUM
--박구곤	1
--손명성	2
--이은선	3
--서의홍	4
--김심선	5