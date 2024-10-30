/* 각 부서별(dept_id)로 급여의 최소값(MIN(salary)과 최대값(MAX(salary))을 나타내시오.
단 최솟값과 최대값이 같은 부서는 출력하지 마시오. */

select dept_id, min(salary) 최소값, max(salary) 최대값 from s_emp
--where절은 일반 조건, 그룹 함수를 포함한 조건은 HAVING 절에 기술한다.
group by dept_id
having min(salary) != max(salary)
order by dept_id;

--질의결과
--dept_id, 최소값, 최대값
--102	2450	3500
--106	0	    795
--110	0	    3000
--111	795	    2400
--112	750	    2100
--113	800	    2300
--118	3200	5000