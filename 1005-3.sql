declare
cursor c1 is select pname,pay,job from personnel;
cname personnel.pname%type;
cpay personnel.pay%type;
cjob personnel.job%type;
begin
open c1;
loop
	fetch c1 into cname,cpay,cjob ; 
		if c1%notfound then
			exit;
		end if;	
		dbms_output.put_line(cname||' '||cpay||' '||cjob);
end loop;
close c1;
end;
/  




