/* 각 부서별(dept_id)로 직책(title)이 사원인 직원들에 대해서만 평균 급여(avg(salary))를 구하시오. */

SELECT dept_id, title, avg(salary) 평균급여 FROM s_emp
where title = '사원'
group by dept_id, title;

--질의결과
--dept_id, title, 평균급여
--110	사원	470
--111	사원	997.5
--112	사원	800
--113	사원	920
--106	사원	795