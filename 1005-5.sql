declare
cursor c2 is select pname,pay,startdate from personnel;
cgigan personnel_r.gigan%type;
crank personnel_r.rank%type;
begin
delete from personnel_r;
for i in c2 loop
	cgigan:=floor(months_between(sysdate,i.startdate)/12)||'³â'||
		floor(mod(months_between(sysdate,i.startdate),12))||'°³¿ù';
	select count(*) into crank from personnel where pay>i.pay;
	insert into personnel_r 
		values (i.pname,i.pay,i.startdate,cgigan,crank);		
end loop;
commit;
end;
/




