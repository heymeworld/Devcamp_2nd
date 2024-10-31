/* 각 부서(dept_id)별로 직책이 사원인(title='사원') 직원들의 
평균 급여를(avg(sal)) 계산해서 보여주시오. */

select dept_id, avg(salary) 사원평균급여
from s_emp
where title='사원'
group by dept_id;

--질의결과
--dept_id, 사원평균급여
--110	470
--111	997.5
--112	800
--113	920
--106	795