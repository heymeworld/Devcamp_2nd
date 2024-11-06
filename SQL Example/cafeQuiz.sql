/* Quiz 1. 봉급(salary) 순위 6등 부터 10등까지 가져오기(s_emp) */
SELECT *
FROM (SELECT ROWNUM RANK, E.* 
        FROM S_EMP E
        ORDER BY SALARY DESC)
WHERE RANK BETWEEN 6 AND 10;  --> ALIAS를 사용하지 않고 ROWNUM을 1 외의 숫자부터 추출하면 출력이 안 된다
                              --> WHERE ROWNUM BETWEEN 6 AND 10 (X)
                              --> ROWNUM을 추출할때, 기준점을 1로 잡고 나머지 데이터는 상대적인 번호로 뽑게된다.
                              --> 즉, 위의 쿼리에서 ROWNUM 1을 기준으로 조회하지 않았기 때문에 데이터를 조회할 수가 없다.


/* Quiz 2. 1부터 n까지의 숫자를 만들어 내기. - level에 연산자를 추가하여 범위를 변경할 수 있다. */

/* 데이터 없이 계산된 값을 생성할 수 없어서 10g 이전 버젼에는 뷰나 테이블을 이용하여 값을 가져왔다.
이러한 방법은 추가적인 I/O가 발생하였으나, Oracle 10g부터는 dual테이블과 connect by level을 사용하여
추가적인 I/O없이 임의의 데이터를 생성할 수 있게 되었다. */

select level from dual 
connect by level <= 5;

/* Quiz 3. 최근 12개월동안의 날짜(yyyymm)출력하기 */

SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -LEVEL), 'YYYYMM')
FROM DUAL
connect by level <= 12
ORDER BY LEVEL DESC;


/* 정답 */
select to_char(add_months(SYSDATE, -12 + level), 'yyyymm') AS YYYYMM from dual 
connect by level <= 12;
--[주의] add_months(SYSDATE-12, level) 이렇게는 안됨. SYSDATE-12는 현재날짜에서 12일'을 빼니까.

/*예상결과
YYYYMM
----------
201704
201705
201706
201707
...
201803 <--- 현재 날짜가 속한 월 */


/* Quiz 4. 15년도 월별 입사자의 수를 세어서 출력하시오.
단, 1월 12월까지 월별로 출력하시오.(CONNECT BY LEVEL) 입사자가 없는달은 0으로 출력하시오. */

SELECT W.YYYYMM, COUNT(START_DATE) 입사자수
FROM (SELECT TO_CHAR(ADD_MONTHS('14/12/01', LEVEL), 'YYYYMM') YYYYMM
        FROM DUAL
        CONNECT BY LEVEL <= 12) W LEFT OUTER JOIN S_EMP M
ON W.YYYYMM = TO_CHAR(M.START_DATE, 'YYYYMM')
GROUP BY W.YYYYMM
ORDER BY W.YYYYMM;


SELECT TO_CHAR(START_DATE, 'YYYYMM')    --> 2015가 포함된 달만 YYYYMM 문자열로 출력
FROM S_EMP
WHERE START_DATE LIKE '15%';


SELECT TO_CHAR(ADD_MONTHS('14/12/01', LEVEL), 'YYYYMM') YYYYMM   --> 2015년도 1월~12월까지 YYYYMM 문자열로 출력
FROM DUAL
CONNECT BY LEVEL <= 12;

/* 예상결과
0 201501
0 201502
3 201503
2 201504
1 201505
0 201506
0 201507
0 201508
0 201509
0 201510
0 201511
0 201512 */

/* 정답 도출 과정

​1. 문제를 적는다.
2. 문제에 테이블과 컬럼을 적는다.

[문제] 15년도 월별(to_char(start_date, 'yyyymm')) 입사자의 수(count(*))를 세어서 출력하시오.
단, 1월 12월까지 월별로 출력하시오. 입사자가 없는달은 0으로 출력하시오.


​3. s_emp테이블에서 15년도 입사자를 조회한다.

select name, to_char(start_date, 'yyyymm') yyyymm
from s_emp
where start_date like '15%'
order by yyyymm;

​질의결과--
김심선 201503
손명성 201503
박구곤 201503
신기웅 201504
서의홍 201504
김정미 201505


​4. 월별 입사자의 수(count(*))를 세려면, yyyymm으로 group by를 해야한다.
[참고] group by yyyymm과 같이 할수 없다. select의 컬럼 목록 보다 group by가 먼저 처리되기 때문

select count(*), to_char(start_date, 'yyyymm') yyyymm
from s_emp
where start_date like '15%'
group by to_char(start_date, 'yyyymm')  -- group by yyyymm과 같이 할수 없다. 
order by yyyymm;

​질의결과--
count(*)  yyyymm
3 201503
2 201504
1 201505

​
5. 위의 결과를 어떻게 하면 아래와 같이 만들까?를 고민한다. 어떻게 하면 3줄이 12줄이 될까?

예상결과--
​0 201501
0 201502
3 201503
2 201504
1 201505
0 201506
0 201507
0 201508
0 201509
0 201510
0 201511
0 201512


6. join을 하면 행의수가 늘어나니, 조인으로 해보자. 어떤테이블과 조인을 해야하나?
connect by level을 이용하라는 힌트를 받았으니. 이걸 이용해 보자.

select level from dual
connect by level <=12;

질의결과--
​LEVEL
1
2
3
4
5
6
7
8
9
10
11
12
​

7. 위의 결과를 어떻게 하면 아래와 같이 만들까? 날짜관련 함수를 찾아보자. add_months()를 써보자.

예상결과--
201501
201502
201503
201504
201505
201506
201507
201508
201509
201510
201511
201512
​

select to_char(add_months(to_date('201501','yyyymm'),level-1), 'yyyymm')
from dual
connect by level <=12;

​
8. 두 테이블을 아우터 조인하니 아래와 같은 결과가 나왔다.

select t1.cnt, t2.yyyymm
from (select count(*) cnt, to_char(start_date, 'yyyymm') yyyymm
	from s_emp
	where start_date like '15%'
	group by to_char(start_date, 'yyyymm')) t1,
	(select to_char(add_months(to_date('201501','yyyymm'),level-1), 'yyyymm') yyyymm
	from dual
	connect by level <=12) t2
where t1.yyyymm (+)= t2.yyyymm
order by 2;

​
질의결과--
null 201501
null 201502
3 201503
2 201504
1 201505
null 201506
null 201507
null 201508
null 201509
null 201510
null 201511
null 201512

​
9. null을 0으로만 바꾸면 원하는 결과와 일치한다. null을 0으로 바꿀 수는 없을까?
찾아보니 NVL()이라는 함수가 있네. 이걸 써보자.

select NVL(t1.cnt,0), t2.yyyymm
from (select count(*) cnt, to_char(start_date, 'yyyymm') yyyymm
	from s_emp
	where start_date like '15%'
	group by to_char(start_date, 'yyyymm')) t1,
	(select to_char(add_months(to_date('201501','yyyymm'),level-1), 'yyyymm') yyyymm
	from dual
	connect by level <=12) t2
where t1.yyyymm (+)= t2.yyyymm
order by 2;
​
질의결과--
0	201501
0	201502
3	201503
2	201504
1	201505
0	201506
0	201507
0	201508
0	201509
0	201510
0	201511
0	201512
*/