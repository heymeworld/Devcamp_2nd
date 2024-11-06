/* 각 부서내(dept_id)에서 몇 명의 직원(count(*))이 근무하는지를 나타내시오. */

SELECT dept_id, count(*) 근무인원 FROM s_emp
group by dept_id
order by dept_id;

--질의결과
--dept_id, 근무인원
--101	1
--102	2
--103	1
--104	1
--105	1
--106	2
--110	4
--111	3
--112	3
--113	5
--118	2