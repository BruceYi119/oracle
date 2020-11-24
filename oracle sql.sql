www.oracle.com
oracle 11g-엔터프라이즈,스탠다드,익스프레스
Oracle Database 11g Release 2 Express Edition for Windows 64
--설치확인
시작-제어판-시스템및보안-관리도구-서비스
--실행
윈도우+R-cmd-sqlplus system/1234
sqlplus 사용자/암호
--환경구축(D:\study\db)
1)테이블스페이스 생성
create tablespace 테이블스페이스명 datafile '파일명' size 크기;
create tablespace summer datafile 'D:\study\db\summer.dbf' size 10m;
2)사용자 생성
create user 사용자명 identified by 암호 [default tablespace 테이블스페이스명];
create user happy identified by day default tablespace summer;
3)권한부여
grant 권한1[,권한2,...] to 사용자명;
grant connect, resource to happy;
4)사용자 접속
conn[ect] 사용자명/암호
conn happy/day
---현재 사용자 확인
show user
--현재 데이터베이스의 모든 사용자 확인
conn system/1234
select username from dba_users;
--테이블스페이스 목록 확인
select tablespace_name, file_name,bytes from dba_data_files;
--scott 사용자 생성(scott.sql)
create user scott identified by TIGER;
--sql 파일실행
@경로/파일명
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
--현재 사용자의 테이블 확인
select * from tab;
set linesize 200
select * from tab;
select * from emp;
set pagesize 30
--프로그램 종료
quit
--재접속
sqlplus happy/day
--현재 사용자의 테이블 확인
select * from tab;
--사용자 암호변경
alter user scott identified by tiger;
--데이터의 조회
select [distinct] {*|컬럼명1,컬럼명2,...} from 테이블명
	[where 조건]
	[group by 그룹절]
	[having 그룹절의 조건]
	[order by 정렬];
--sawon 테이블의 모든 내용출력
select * from sawon;
--sawon 테이블의 이름, 입사일, 급여
select saname,sahire,sapay from sawon;
--personnel 테이블의 구조확인
desc[ribe] 테이블명;
desc personnel;
--personnel 테이블에서 사번,이름,직책, 급여,보너스
select pno,pname,job,pay,bonus from personnel;
--personnel 테이블에서 사번,이름,직책, 급여, 보너스, 합계
select pno,pname,job,pay,bonus,pay+bonus from personnel;
--nvl(표현식,값)
select pno,pname,job,pay,nvl(bonus,'값없음') from personnel;
--관계형데이터베이스(rdbms) -> 객체형데이터베이스 -> 객체관계형데이터베이스
--화면 지우기
cl scr
--컬럼명에 알리아스(별칭)
select pno 사번, pname name, job Job, pay, bonus 보너스, pay+nvl(bonus,0) Total from personnel;
select pno 사번, pname "name", job "Job", pay "급 여", bonus 보너스,pay+nvl(bonus,0) "Total" from personnel;
--이름,직책, 급여출력(단 직책이 매니져 또는 세일즈맨인 사람)
select pname,job,pay from personnel where job='MANAGER' or job='SALESMAN';
select pname,job,pay from personnel	where job in ('MANAGER','SALESMAN');
--이름,직책, 급여출력(단 급여가 1000이상 2000 이하)
select pname,job,pay from personnel	where pay>=1000 and pay<=2000;
--between a and b :a 에서 b 사이
select pname,job,pay from personnel	where pay between 1000 and 2000;
--이름,직책, 급여출력(단 직책이 세일즈맨이 아닌사람)
select pname,job,pay from personnel	where job!='SALESMAN';
select pname,job,pay from personnel	where job<>'SALESMAN';
--이름,직책,급여,보너스 출력(단 보너스를 받는사람)
select pname,job,pay,bonus from personnel where bonus >0;
--이름,직책,급여,보너스 출력(단 보너스를 받지 않는 사람)
select pname,job,pay,bonus from personnel where bonus <=0;
--이름,급여,보너스 출력(보너스가 널인사람)
select pname,pay,bonus from personnel where bonus=null;   --X
select pname,pay,bonus from personnel where bonus is null;
--이름,급여,보너스 출력(보너스가 널이 아닌 사람)
select pname,pay,bonus from personnel where bonus is not null;

INSERT INTO 테이블명 [WHERE 조건]
UPDATE 테이블명 SET 컬럼=값,컬럼=값,... [WHERE 조건]
DELETE [FROM] 테이블명 [WHERE 조건]
SELECT {* | 컬럼명,컬럼명 [as] 별칭명,...} FROM 테이블명 [as] 별칭명
[WHERE 조건]
[GROUP BY 그룹기준]
[HAVING 그룹조건]
[ORDER BY 정렬기준 정렬방식]
정렬방식
-오름차순(기본, ASC) : 숫자 작->큰, A->Z, ㄱ->ㅎ, 예전->최근
-내림차순(DESC)

--이름,직책,급여 출력
select pname,job,pay from personnel;
select pname||job||pay from personnel;
select pname||'의 직책은'||job||'이고 급여는 '||pay from personnel;
--%:여러 문자열, _:문자하나
--이름,직책,급여 출력(단 이름이 5글자인사람)
select pname,job,pay from personnel
	where pname like '_____';
--이름,직책,급여 출력(단 이름의 두번째 글자가 A인사람)
select pname,job,pay from personnel
	where pname like '_A%';
--이름,직책,급여 출력(단 이름이 J로 시작하는 사람)
select pname,job,pay from personnel
	where pname like 'J%';
--이름,직책,급여 출력(단 이름이 N로 끝나는 사람)
select pname,job,pay from personnel
	where pname like '%N';

--sql파일 실행
@D:\study\oracle\data.txt
--휴지통비우기
purge recyclebin;
--합집합, 교집합, 차집합
desc dept
select * from dept;
create table d1
	as
	select * from dept;
select * from tab;
select * from d1;
create table d2
	as
	select * from dept where deptno>20;
select * from d2;
insert into d2 values (99,'기획부','서산');
insert into d2 values (88,'이벤트','제주');
select * from d1;
select * from d2;
--합집합
select * from d1
	union
	select * from d2;
select * from d1
	union all
	select * from d2;
--교집합
select * from d1
	intersect
	select * from d2;
--차집합
select * from d1
	minus
	select * from d2;
select * from d2
	minus
	select * from d1;
--정렬
select * from personnel;
select * from personnel
	order by pay;
select * from personnel
	order by pay desc;
select * from personnel
	order by job asc;
select * from personnel
	order by job asc,pay desc;
--함수
conn happy/day
select * from sawon;
select * from dept;
select 10/7 from sawon;
select 10/7 from dept;
select 10/7 from dual;
select * from dual;
select 10/7, ceil(10/7),floor(10/7) from dual;
select 10/7,round(10/7,3),trunc(10/7,3) from dual;
select 1000/7,round(1000/7,-2),trunc(1000/7,-2) from dual;
--사원테이블에서 이름,급여,월급,세금출력
월급=급여/12, 단 50원이상 반올림하여 백단위 표현
세금은 급여의 3%로 원단위 절삭
select saname,sapay from sawon;
select saname,sapay,sapay/12 월급,sapay*0.03 세금 from sawon;
select saname,sapay,round(sapay/12,-2) 월급,
	trunc(sapay*0.03,-1) 세금 from sawon;
select mod(10,3),abs(-777),sign(-777),power(2,4) from dual;
select pname,lower(pname),initcap(pname),upper(pname)
	from personnel;
select concat(pname,job),pname||job from personnel;
select concat(pname,job),pname||job||pay from personnel;
select length('happy'),length('경영기술개발원')	from dual;
select lengthb('happy'),lengthb('경영기술개발원')	from dual;
select 'abcdefghijk', substr('abcdefghijk',3),
		substr('abcdefghijk',5,2) from dual;
select 'oraora',lpad('oraora',15,'*') from dual;
select 'oraora',rpad('oraora',15,'!') from dual;
--decode(표현식,조건1,값1,조건2,값2,조건3,값3,...)
select pname,job,pay from personnel;
MANAGER이면 급여의 10%를 incentive
SALESMAN        15%
PRESIDENT       20%
select pname,job,pay,
	decode(job,'MANAGER',pay*0.1,'SALESMAN',pay*0.15,
		'PRESIDENT',pay*0.2) incentive from personnel;
--사원테이블에서 이름,부서,부서명출력
단, 부서번호가 10 이면 총무부
           20     영업부
		   30     전산부
		   40     관리부
select saname,deptno,decode(deptno,10,'총무부',20,'영업부',
		30,'전산부',40,'관리부')	 부서명 from sawon;
select * from gogek;
--고객테이블에서 고객명,주민번호,성별출력
select goname,gojumin,substr(gojumin,8,1) from gogek;
select goname,gojumin,
	decode(substr(gojumin,8,1),1,'남',2,'여') 성별 from gogek;
--날짜함수
select sysdate from dual;
--날짜-날짜=숫자
select pname,startdate from personnel;
select pname,sysdate-startdate 근무일수 from personnel;
--날짜+숫자=날짜
select sysdate+3 from dual;
select sysdate from dual;
alter session
	set nls_date_format='yyyy-mm-dd hh:mi:ss';
select sysdate from dual;
alter session
	set nls_date_format='yyyy-mm-dd hh:mi:ss am';
select sysdate from dual;
alter session
	set nls_date_format='yyyy-mm-dd hh:mi:ss am bc';
select sysdate from dual;
alter session
	set nls_date_format='yyyy-mm-dd hh24:mi:ss bc';
select sysdate from dual;
--스콧사용자로
--12.입사일이 81/04/02보다 늦고 82/12/09보다 빠른 사원의 이름,월급,부서번호 출력

select ename, sal, deptno from emp where hiredate > '81/04/02' and hiredate < '82/12/09';

--13.급여가 1600보다 크고 3000보다 작은 사람의 이름,직업, 급여 출력

select ename, job, sal from emp where sal > 1600 and sal < 3000;

--14.사원번호가 7654와 7782사이 이외의 사원의모든 정보출력

select * from emp where empno!=7654 and empno != 7782;

--16.입사일이 81년 이외에 입사한 사람의 모든 정보 출력

select * from emp where hiredate < '81/01/01' or hiredate > '81/12/31';

--17.직업이 MANAGER와 SALESMAN인 사람의 모든 정보 출력

select * from emp where job='MANAGER' or job='SALESMAN';

--18.부서번호가 20,30번을 제외한 모든 사람의 이름, 사원번호, 부서번호 출력

select ename, empno, deptno from emp where deptno != 20 and deptno != 30;

--19.이름이 S로 시작하는사원의 사원번호, 이름, 입사일, 부서번호 출력

select empno, ename, hiredate, deptno from emp where ename like 'S%';

--20.입사일이 81년도인 사람의 모든 정보 출력

select * from emp where hiredate > '80/12/31' and hiredate < '82/01/01';

--21.이름중 S자가들어가 있는 사람만 모든정보 출력

select * from emp where ename like '%S%';

--22.이름이 S로시작하고 마지막 글자가 T인 사람의 모든 정보 출력(단 이름은 전체 5자리)

select * from emp where ename like 'S___T';

--23.첫번째 문자는관계없고 두번째 문자가 A인사람의 정보출력

select * from emp where ename like '_A%';

--24.커미션이 NULL인사람의 정보를출력

select * from emp where comm is null;

--25.커미션이 NULL이아닌 사람의 모든 정보 출력

select * from emp where comm is not null;

--26.부서가 30번부서이고 급여가1500이상인 사람의 이름, 부서,우러급출력

select ename, deptno, sal from emp where deptno = 30 and sal >= 1500;

--27.이름의 첫글자가 K로 시작하거나부서번호가 30번인사람의 사원번호, 이름, 부서번호 출력

select empno, ename, deptno from emp where ename like 'K%' or deptno=30;

--28.급여가 1500이상이고 부서번호가 30번인 사원중 직업이 MANAGER인 사람의 정보출력

select * from emp where sal >= 1500 and deptno = 30 and job='MANAGER';

--29.부서번호가 30번인 사람중 사원번호 정렬하라

select * from emp where deptno=30 order by empno;

--30.급여가 많은 순 정렬

select * from emp order by sal desc;

--31.부서번호로 오름차순 정렬후 급여많은순 출력

select * from emp order by deptno , sal desc;

--32.부선번호로 내림차순정렬하고 이름순 오름차순, 급여순 내림차순 정렬

select * from emp order by deptno desc, ename, sal desc;

--sqldeveloper 다운로드
C:\Program Files\Java\jdk1.8.0_261
--
날짜-날짜=숫자
날짜+숫자=날짜
날짜+숫자/24=날짜에 시간을 더함
날짜+숫자/1440=날짜에 분을 더함
select sysdate from dual;
alter session
	set nls_date_format='yy-mm-dd hh:mi:ss am';
select sysdate from dual;
select sysdate,sysdate+1,sysdate+1/24,sysdate+1/1440 from dual;
select saname,sahire,months_between(sysdate,sahire) from sawon;
select saname,sahire,add_months(sysdate,2) from sawon;
select sysdate,add_months(sysdate,5),last_day(sysdate)
	from dual;
select sysdate,next_day(sysdate,'금') from dual;
--사원테이블에서 이름,입사일,근무기간 출력
--단 근무기간은 xx년xx개월형태
select saname,sahire from sawon;
select saname,sysdate-sahire from sawon;
select saname,months_between(sysdate,sahire) 개월 from sawon;
예)27개월xxxxx 근무---> 27/12  2년 3개월
select saname,
	floor(months_between(sysdate,sahire)/12)||'년'||
	floor(mod(months_between(sysdate,sahire),12))||'개월' 근무기간
    from sawon;
--데이터형변환
to_char(값[,형식])
to_number
to_date(값,'형식')
select 10000,to_char(10000) from dual;
select 10000,to_char(10000,'$99,999') from dual;
select 10000,to_char(10000,'$000,000') from dual;
select saname,to_char(sahire,'yyyy"년" mm"월" dd"일" day')
	from sawon;
select '5000',to_number('5000') from dual;
--그룹함수
select * from sawon;
select count(saname),count(sapay),count(*) from sawon;
select count(*) from sawon;
select sum(sapay),avg(sapay),min(sapay),max(sapay) from sawon;
--직책별 급여의 평균
select sajob,avg(sapay) from sawon
	group by sajob;
--직책별 급여의 평균과 인원수
select sajob,avg(sapay),count(*) from sawon
	group by sajob;
--부서별 최소급여,최대급여,급여평균,인원수
select deptno,min(sapay),max(sapay),avg(sapay),count(*)
	from sawon
	group by deptno;
--부서별 최소급여,최대급여,급여평균,인원수(단 급여평균이 2000이상인 경우만 )
select deptno,min(sapay),max(sapay),avg(sapay),count(*)
	from sawon
	where avg(sapay)>=2000
	group by deptno;		 X
select deptno,min(sapay),max(sapay),avg(sapay),count(*)
	from sawon
	group by deptno
	having avg(sapay)>=2000;
--사원테이블에서 과장,대리,부장의 급여합계와 인원수 출력
select sajob,sum(sapay),count(*) from sawon
	group by sajob
	having sajob='과장' or sajob='대리' or sajob='부장';
select sajob,sum(sapay),count(*) from sawon
	group by sajob
	having sajob in ('과장','대리','부장');
==조인
select * from personnel;
select * from division;
--사번,이름,급여,부서번호,부서명,부서전화번호
select pno,pname,pay,dno,dname,phone
	from personnel,division;  X
select personnel.pno,pname,pay,personnel.dno,dname,phone
	from personnel,division;   X
--Equi조인
select pno,pname,pay,personnel.dno,dname,phone
	from personnel,division
	where personnel.dno=division.dno;
--테이블명에 별칭주기
select pno,pname,pay,p.dno,dname,phone
	from personnel p,division d
	where p.dno=d.dno;
--
select * from student;      --접수번호,이름,주소,출신학교,학과코드
select * from score;        --접수번호,수능점수,내신점수
select * from tech;         --접수번호, 면접점수,체력장
select * from part;
--접수번호,이름,출신학교,수능점수,내신점수
select st.bunho,irum,school,s1,s2
	from student st,score sc
	where st.bunho=sc.bunho;
--접수번호,이름,출신학교,수능점수,내신점수,면접점수,체력장
select st.bunho,irum,school,s1,s2,s3,s4
	from student st,score sc, tech t
	where st.bunho=sc.bunho and
	      st.bunho=t.bunho;

--접수번호, 이름, 수능점수, 내신점수, 면접점수, 체력장, 합계, 학과명
select
    st.bunho 접수번호, st.irum 이름, st.juso 주소, p.partname 학과명, sc.s1 수능점수, sc.s2 내신점수, t.s3 면접점수, t.s4 체력장, sc.s1 + sc.s2 + t.s3 + t.s4 합계
from student st
join score sc on st.bunho = sc.bunho
join tech t on st.bunho = t.bunho
join part p on st.partcd = p.partcd
order by st.irum;

--Equi join
select
    st.bunho 접수번호, st.irum 이름, p.partname 학과명, sc.s1 수능점수, sc.s2 내신점수, t.s3 면접점수, t.s4 체력장
from student st, score sc, tech t, part p
where st.bunho = sc.bunho and st.bunho = t.bunho and st.partcd = p.partcd;

select * from personnel;
select * from division;

--이름, 업무, 부서명, 입사일
select
    p.pname 이름, p.job 업무, d.dname 부서명, p.startdate 입사일
from personnel p
join division d on p.dno = d.dno
order by p.pname;

--using 구문
select
    p.pname 이름, p.job 업무, d.dname 부서명, p.startdate 입사일
from personnel p
join division d using(dno)
order by  p.pname;

select * from personnel;
select * from paygrade;

--Non Equi join
--사번, 이름, 급여, 금여등급
select
    pa.pno, pa.pname, pa.pay, pa.grade
from personnel pa, paygrade pa
where pay between pa.lowpay and pa.highpay;

--self join 사번, 이름, 업무, 급여, 관리자명
select
    p.pno 사번, p.pname 이름, p.job 업무, p.pay 급여, pt.pname 관리자명
from personnel p
join personnel pt on p.manager = pt.pno;

select * from sawon;
select * from dept;

--outer join
insert into sawon(sabun, saname) values (100, '팟쥐');
update sawon set sabun = 101 where saname = '팟쥐';
insert into dept values (91, '이벤트', '서산');
commit;
--사번, 이름, 급여, 부서명
select
    s.sabun, s.saname, s.sapay, d.dname
from sawon s
join dept d on s.deptno = d.deptno(+);
--표준 sql
select
    s.sabun, s.saname, s.sapay, d.dname
from sawon s
left outer join dept d on s.deptno = d.deptno;

select
    s.sabun, s.saname, s.sapay, d.dname
from sawon s
join dept d on s.deptno(+) = d.deptno;
--표준 sql
select
    s.sabun, s.saname, s.sapay, d.dname
from sawon s
right outer join dept d on s.deptno = d.deptno;

--전체보기
select
    s.sabun, s.saname, s.sapay, d.dname
from sawon s
full outer join dept d on s.deptno = d.deptno;

--서브쿼리
--김희선과 같은 동네 사는사람의 이름, 출신학교, 주소
select
    irum, school, juso
from student
where juso = (select juso from student where irum = '김희선');

--퍼스널테이블에서 워드보다 급여를 많이 받는 사람의 이름, 직책, 급여
select * from personnel;

select
    pname, job, pay
from personnel
where pay > (select pay from personnel where pname = 'WORD');

--제임스랑 같은 직책인 사람의 이름, 직책, 급여
select
    pname, job, pay
from personnel
where job = (select job from personnel where pname = 'JAMES');

--30번 부서의 급여보다 많이 받는 사람의 이름, 직책, 급여, 부서번호
select pay from personnel where dno = 30;

select
    pname, job, pay, dno
from personnel
where pay >all (select pay from personnel where dno = 30);

select
    pname, job, pay, dno
from personnel
where pay >any (select pay from personnel where dno = 30);

--30번 부서의 급여보다 많이 받는 사람의 이름, 직책, 급여, 부서번호 (1600, 1450, 3550, 1200)
select
    pname, job, pay, dno
from personnel
where pay >all (select pay from personnel where dno = 30) and dno <> 30;

--30번 부서의 업무와 같은 일을 하는 사람의 이름, 직책, 급여, 부서번호
select job from personnel where dno = 30;

select
    pname, job, pay, dno
from personnel
where job in (select job from personnel where dno = 30);

select
    pname, job, pay, dno
from personnel
where job =any (select job from personnel where dno = 30);

--직원의 평균 급여보다 많이 받는 사람의 이름, 직책, 급여, 부서번호
select avg(pay) from personnel;

select
    pname, job, pay, dno
from personnel
where pay > (select avg(pay) from personnel);

--입력
desc student;
select * from student;

insert into student values (2003120011, '홍길동', '경기도', '구리고', 11);
insert into student (bunho, irum, juso, school, partcd) values (2003120011, '홍길동', '경기도', '구리고', 11);
rollback;

desc personnel;
select * from personnel;

insert into personnel (pno, pname, pay, startdate) values (9999, '둘리', 100, sysdate);
insert into personnel (pno, pname, pay, startdate, bonus) values (7777, '고길동', 4000, sysdate, null);
insert into personnel (pno, pname, pay, startdate, job) values (3333, '까치', 300, sysdate, 'null');
commit;

--DML(데이터 조작 언어) : 입력, 수정, 삭제처럼 데이터에 변형을 주거나 조회하는 명령어
select * from personnel;
select * from personnel where dno = 30;

delete from personnel where dno = 30;
delete from personnel;
rollback;

--다중입력
create table test
as select pno, pname, pay from personnel where 1 = 2;

--퍼스널테이블의 데이터가 test1, test2에 입력되도록
create table test2
as select * from personnel where 1 = 2;

insert all
    into test1 (pno, pname, pay) values (pno, pname, pay + bonus)
    into test2 (pno, pname, pay) values (pno, pname, 0)
select * from personnel;

-- 조회한 데이터 테이블로 생성
create table test as select pno, pname, pay from personnel;

-- 테이블 삭제
drop table test;

-- 테이블 내용 비우기
TRUNCATE table test;

--1. EMP Table에서 이름, 급여, 커미션 금액, 총액(salt +comm)을 구하여 총액이 많은 순서로 출력하라. 단, 커미션이 NULL인 사람은 제외한다.
select * from emp;
select
    ename 이름, sal 급여, comm "커미션 금액", (sal + comm) 총액
from emp
where comm is not null
order by 총액 desc;

--2. 10번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스 금액, 부서 번호를 출력하라.
select * from emp;
select
    ename 이름, sal 급여, sal + (sal * 0.13) "보너스 금액", deptno 부서번호
from emp;

--3. 30번 부서의 연봉을 계산하여 이름, 부서번호, 급여, 연봉을 출력하라. 단 연말에 급여의 150%를 보너스로 지급한다. *
select * from emp;
select
    ename 이름, deptno 부서번호, sal 급여, sal / 12 연봉
from emp
where deptno = 30;

--4. 부서번호가 20인 부서의 시간당 임금을 계산하여 출력하라. 단, 1달의 근무일수는 12일이고, 1일 근무시간은 5시간이다. 출력양식은 이름, 급여, 시간당 임금(소수이하 1번째 자리에서 반올림)을 출력하라.select * from emp;
select * from emp;
select
    ename 이름, sal 급여, round(((sal / 12) / 12) / 5, 1) "시간당 임금"
from emp
where deptno = 20;

--5. 급여가 $1,500부터 $3,000사이의 사람은 급여의 15%를 회비로 지불하기로 하였다. 이를 이름, 급여, 회비(-2자리에서 반올림)를 출력하라.
select * from emp;
select
    ename 이름, sal 급여, round(sal * 0.15, -2) "회비"
from emp
where sal between 1500 and 3000;

--6. 급여가 $2,000이상인 모든 사람은 급여의 15%를
--경조비로 내기로 하였다. 이름, 급여, 경조비(소수점 이하 절삭)를 출력하라.
select * from emp;
select
    ename 이름, sal 급여, trunc(sal * 0.15) "경조비"
from emp
where sal >= 2000;

--7. 입사일부터 지금까지의 날짜수를 출력하라. 부서번호, 이름, 입사일, 현재일, 근무일수(소수점 이하 절삭), 근무년수, 근무월수(30일 기준), 근무주수를 출력하라.
select * from emp;
select
    deptno 부서번호, ename 이름, hiredate 입사일, sysdate 현재일,  hiredate 근무일수, trunc(MONTHS_BETWEEN(SYSDATE, hiredate) / 12) 근무년수, trunc(MONTHS_BETWEEN(SYSDATE, hiredate)) 근무월수, trunc(MONTHS_BETWEEN(SYSDATE, hiredate) * 4 / 7) 근무주수
from emp;

--8. 모든 사원의 실수령액을 계산하여 출력하라. 단 급여가 많은 순으로 이름, 급여, 실수령액을 출력하라(실수령액은 급여에 대해 10%의 세금을 뺀 금액)
select * from emp;
select
    ename 이름, sal 급여, (sal / 12) - (sal / 12 * 0.1) 실수령액
from emp;

--9. 입사일로부터 90일이 자난 후의 사원 이름, 입사일, 90일 후의 날, 급여를 출력하라.select * from emp;
select * from emp;
select
    ename 이름, hiredate 입사일, hiredate + (to_char(hiredate, 'mm') + 90) "90일 후의 날", sal 급여
from emp;

--10. 입사일로부터 6개월이 지난 후의 입사일, 6개월 후의 날짜, 급여를 출력하라.
select * from emp;
select
    add_months(hiredate, 6) "6개월 후의 입사일", add_months(sysdate, 6) "6개월 후의 날짜", sal 급여
from emp;

--11. 입사한 달의 근무일수를 계산하여 부서번호, 이름, 근무일수를 출력하라.
select * from emp;
select
    deptno 부서번호, ename 이름, last_day(hiredate) - hiredate 근무일수
from emp;

--12. 모든 사원의 60일이 지난 후의 ‘MONDAY'는 몇 년, 몇 월, 몇 일 인가를 구하여 이름, 입사일, ’MONDAY'를 출력하라.
select * from emp;
select
    ename 이름,
    hiredate 입사일,
    to_char(hiredate + (to_char(hiredate, 'dd') + 60), 'yyyy"년" mm"월" dd"일"') MONDAY
from emp;

--13. 입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 출력하라.
select * from emp;
select
    ename 이름, hiredate 입사일, trunc(MONTHS_BETWEEN(SYSDATE, hiredate)) 근무일수
from emp;

--14. 입사일을 ‘1996년 5월 14일’의 형태로 이름, 입사 일을 출력하라.
select * from emp;
select
    ename 이름,
    decode(
        SUBSTR(to_char(hiredate, 'yyyy"년" mm"월" dd"일"'), 7, 1)
        , '1'
        , to_char(hiredate, 'yyyy"년" mm"월" dd"일"')
        , '0', to_char(hiredate, 'yyyy"년 "') || substr(to_char(hiredate, 'mm"월" '), 2) || to_char(hiredate, 'dd"일"')
    ) 입사일
from emp;

--15. 이름의 글자수가 6자 이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 이름만을 출력하라.
select * from emp;
select
    lower(substr(ename, 0, 3))
from emp
where ename like '______%';

--16. 10번 부서 월급의 평균, 최고, 최저 인원수를 구하여 출력하라.
select * from emp;
select
    avg(sal), max(sal), min(sal), count(empno)
from emp
where deptno = 10;

--17. 각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
select * from emp;
select
    deptno, avg(sal), max(sal), min(sal), count(empno)
from emp
group by deptno;

--18. 각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
select * from emp;
select
    deptno 부서번호, job 업무명, count(job)
from emp
group by deptno, job;

--19. 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
select * from emp;
select
    job 업무명, count(job)
from emp
group by job
having count(job) >= 4;

--20. 각 부서별 평균 월급, 전체월급, 최고 월급, 최저월급을 구하여 평균 월급이 많은 순으로 출력하라.select * from emp;
select * from emp;
select
    deptno, avg(sal) 평균월급, sum(sal + nvl(comm, 0)) 전체월급, max(sal) 최고월급, min(sal) 최저월급
from emp
group by deptno
order by 평균월급 desc;

--====조인/서브쿼리====
--1. EMP와 DEPT TABLE을 JOIN하여 부서번호, 부서명, 이름, 급여를 출력하라.
select * from emp;
select * from dept;
select
    e.deptno 부서번호, d.dname 부서명, e.ename 이름, e.sal 급여
from emp e
join dept d on e.deptno = d.deptno;

--2. 이름이 ‘ALLEN'인 사원의 부서명을 출력하라.
select * from emp;
select
    d.dname 부서명
from emp e
join dept d on e.deptno = d.deptno
where e.ename = 'ALLEN';

--3. DEPT Table에 있는 모든 부서를 출력하고, EMP Table에 있는 DATA와 JOIN하여 모든 사원의 이름, 부서번호, 부서명, 급여를 출력하라.
select * from emp;
select * from dept;
select
    e.ename 이름
    , e.deptno 부서번호
    , d.dname 부서명
    , e.sal 급여
from dept d
left outer join emp e on d.deptno = e.deptno;

--4. EMP Table에 있는 EMPNO와 MGR을 이용하여 서로의 관계를 다음과 같이 출력하라.
--‘SMITH'의 매니저는 FORD이다.’
select * from emp;
select * from dept;
select
    e.ename || '의 매니저는 ' || et.ename || '이다.' 매니저
from emp e
join emp et on e.mgr = et.empno
where e.ename = 'SMITH';

--5. 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여 직무를 출력하라.
select * from emp;
select * from dept;
select
    e.ename 이름, d.dname 부서명, e.sal 급여, e.job 직무
from emp e
join dept d on e.deptno = d.deptno
where e.job = (select job from emp where ename = 'ALLEN');

--6. ‘JONES'가 속해있는 부서의 모든 사람의 사원번호, 이름, 입사일, 급여를 출력하라.
select * from emp;
select * from dept;
select
    e.empno 사원번호, e.ename 이름, e.hiredate 입사일, e.sal 급여, e.deptno
from emp e
where e.deptno = (select deptno from emp where ename = 'JONES');

--7. 전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
select * from emp;
select * from dept;
select avg(sal) from emp;
select
    e.empno 사원번호, e.ename 이름, d.dname 부서명, e.hiredate 입사일, d.loc 지역, e.sal 급여
from emp e
join dept d on e.deptno = d.deptno
where e.sal >(select avg(sal) from emp);

--8. 10번 부서 사람들 중에서 20번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일, 지역을 출력하라.
select * from emp;
select * from dept;
select
    e.empno 사원번호, e.ename 이름, d.dname 부서명, e.hiredate 입사일, d.loc 지역, e.job
from emp e
left join dept d on e.deptno = d.deptno
where e.deptno = 10 and e.job in (select job from emp where deptno = 20);

--9. 10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일, 지역을 출력하라.
select * from emp;
select * from dept;
select
    e.empno 사원번호, e.ename 이름, d.dname 부서명, e.hiredate 입사일, d.loc 지역, e.job
from emp e
left join dept d on e.deptno = d.deptno
where e.deptno = 10 and e.job in (select job from emp where deptno <> 30);

--10. 10번 부서와 같은 일을 하는 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은 순으로 출력하라.
select * from emp;
select * from dept;
select
    e.empno 사원번호, e.ename 이름, d.dname 부서명, e.hiredate 입사일, d.loc 지역, e.sal 급여
from emp e
left join dept d on e.deptno = d.deptno
where e.job in (select job from emp where deptno = 10)
order by e.sal desc;

--11. 'MARTIN' 이나 ‘SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라.
select * from emp;
select * from dept;
select
    e.empno 사원번호, e.ename 이름, e.sal 급여
from emp e
where e.sal in (select sal from emp where ename in ('MARTIN', 'SCOTT'));

--12. 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select * from emp;
select * from dept;
select
    e.empno 사원번호, e.ename 이름, e.sal 급여
from emp e
where e.sal > (select max(sal) from emp where deptno = 30);

--13.급여가 30번 부서의 최저 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select * from emp;
select * from dept;
select min(sal) from emp where deptno = 30;
select
    e.empno 사원번호, e.ename 이름, e.sal 급여
from emp e
where e.sal > (select min(sal) from emp where deptno = 30);

--e2 사번, 이름, 직책, 취미 컬럼을 가지는 빈테이블
create table e2
as select empno, ename, job, 'null' hobby from emp where 1=2;

--오라클의 테이블스페이스 정보
select * from dictionary where table_name like '%TABLESPACE%';
--테이블스페이스 정보
select tablespace_name, status from DBA_TABLESPACES;
--오라클이 사용하는 데이터 파일정보
select * from dictionary where table_name like '%DATA%';
--데이터 파일 정보
select file_name, file_id, tablespace_name, status, online_status from DBA_DATA_FILES;
-- 오라클의 사용자 정보
select * from dictionary where table_name like '%USERS%';
select username, default_tablespace, account_status, lock_date, temporary_tablespace, profile from DBA_USERS;
--잠김계정풀기
alter user hr
    identified by hr -- 암호변경
    account unlock;

alter user hr/hr
    account unlock;

--d3 테이블에 d4를 병합 (입력, 수정)
merge into d3
using d4
on (d3.deptno = d4.deptno)
when matched then
update set d3.dname = d4.dname, d3.loc = d4.loc;
when not matched then
insert values (d4.deptno, d4.dname, d4.dloc);
--데이터 딕션어리(dictionary)
dba_xxxxxxxxxxs
user_xxxxxxxxxs
all_xxxxxxxxxxs
select * from dictionary;
--오라클의 테이블스페이스 정보
select * from dictionary where table_name like '%TABLESPACE%';
--해피사용자의 테이블 위치 확인
select table_name from dictionary where table_name like '%TABLE%';
select table_name, tablespace_name from USER_TABLES;
--rownum 정렬
select rownum, saname, sapay, sajob from (
    select saname, sapay, sajob from sawon
    where sapay is not null
    order by sapay desc
);
--트랜잭션 : 프로세스가 처리되는 최소단위
--commit-트랜잭션 정상처리, rollback-트랜잭션 이전상태로
--DDL : 오라클 db, tablespace, object등을 생성, 수정, 삭제해주는 명령어
--autocommit 수행
--DCL : 사용자에게 권한을 부여, 박탈
--autocommit 수행
--DML : 데이터 조작언어, 테이블에 데이터를 입력, 수정, 삭제, 병합할 수 있게 해주는 명령어
--트랜잭션의 대상
--외부파일 입력

--반복문
begin
    for i in 2..100000 loop
        insert into test1 values (i, 'kim', sysdate);
    end loop;
end loop;
/

--db > 테이블스페이스 (system, undo, temp, ...) > 세그먼트 (테이블, 인덱스, 뷰, ...) > 인스턴트 > 블럭
--테이블스페이스 생성
--create tablespace 테이블스페이스명
--  datafile '경로및파일명' size 크기 [,
--  '경로및파일명' size 크기,
--  ...]

create tablespace spring datafile 'D:\study\db\spring1.dbf' size 4m, 'D:\study\db\spring2.dbf' size 4m;

desc dba_data_files;

select tablespace_name, file_name, bytes from dba_data_files order by tablespace_name;

create tablespace winter datafile 'D:\study\db\winter.dbf' size 10m;

--테이블스페이스 수정
--1)데이터파일 추가
alter tablespace spring add datafile 'D:\study\db\spring3.dbf' size 4m;
--2)데이터파일 크기 수정
alter database datafile 'D:\study\db\winter.dbf' resize 20m;
--3)데이터파일을 자동증가로 변경
create tablespace summer datafile 'D:\study\db\summer.dbf' size 4m;

alter database datafile 'D:\study\db\summer.dbf' autoextend on next 2m maxsize 10m; --파일크기가 증가할때 2m가씩 증가하고 최대 사이즈는 10m

-- 테이블스페이스 용량 채우기
-- 외부파일 입력
create user tom identified by jerry;
grant connect, resource to tom;
alter user tom default tablespace SUMMER;

--테이블스페이스 삭제
drop tablespace spring; -- 데이터 파일이 남아있다
drop tablespace summer including contents; -- 데이터가 있을때(옵션)
drop tablespace winter including contents and datafiles; -- 데이터가 있을때/데이터 파일도 날려라(옵션)
drop tablespace autumn including contents and datafiles; -- 데이터가 있을때/데이터 파일도 날려라(옵션)

--테이블스페이스 이동
create tablespace autumn datafile 'D:\study\db\autumn.dbf' size 10m;
create tablespace winter datafile 'D:\study\db\winter.dbf' size 10m;
desc dba_users;
select username, default_tablespace from dba_users;

--톰사용자가 winter 테이블스페이스를 사용하도록 설정
alter user tom default tablespace winter;

desc user_tables;
select table_name, tablespace_name from user_tables;

--D:\study\db\AUTUMN.DBF 을 D:\study\AUTUMN.DBF 로 이동
--1)테이블스페이스의 상태변경
alter tablespace autumn offline;
--데이터 파일 위치이동
--'D:\study\db\AUTUMN.DBF' 파일을 'D:\down\AUTUMN.DBF' 로 이동
--데이터파일의 위치를 오라클 정보변경
select * from dictionary where table_name like '%TABLESPACE%';
select * from dictionary where table_name like '%DATAFILE%';
select * from USER_TABLESPACES;
alter tablespace autumn rename datafile 'D:\study\db\AUTUMN.DBF' to 'D:\down\AUTUMN.DBF';
alter tablespace autumn rename datafile 'D:\down\AUTUMN.DBF' to 'D:\study\db\AUTUMN.DBF';
alter tablespace autumn online;

select * from user_tablespaces;
desc dba_data_files;
select * from dba_data_files;

--다른 테이블 스페이스에 테이블생성
create table test1(
    a number,
    b varchar2(10),
    d date
) tablespace winter;

--테이블스페이스 확인
select table_name, tablespace_name from user_tables;