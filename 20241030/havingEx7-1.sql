/* 각 직책별(title)로 급여의 총합(sum(salary))을 구하되 직책이 부장인 사람(title='부장')은 제외하시오.
단, 급여총합이 8000(만원) 이상(sum >= 8000)인 직책만 나타내며, 
급여 총합에 대한 오름차순(order by asc)으로 정렬하시오. */

select title, sum(salary) as 급여총합 from s_emp
where title not like '%부장'
group by title
having sum(salary) >= 8000
order by sum(salary) desc;

--질의결과
--TITLE, 급여총합
--과장	11500
--사원	8090