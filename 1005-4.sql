--퍼스널테이블에서 이름,급여,입사일, 근무기간,급여순위를 구하여 personnel_r테이블에 삽입
declare
cursor c2 is select pname,pay,startdate from personnel;
cpname personnel.pname%type;
cpay personnel.pay%type;
cstartdate personnel.startdate%type;
cgigan personnel_r.gigan%type;
crank personnel_r.rank%type;
begin
delete from personnel_r;
open c2;
loop
	fetch c2 into cpname,cpay,cstartdate;
--		if c2%notfound then
--			exit;
--		end if;		
		exit when(c2%notfound);
		cgigan:=floor(months_between(sysdate,cstartdate)/12)||'년'||
			floor(mod(months_between(sysdate,cstartdate),12))||'개월';
		select count(*) into crank from personnel where pay>cpay;
		crank := crank+1;
		insert into personnel_r 
			values (cpname,cpay,cstartdate,cgigan,crank);
end loop;
close c2;
commit;
end;
/




