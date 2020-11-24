--m279-087-07
declare
cursor c4 is select name,kor,eng,mat from sung;
chap result.hap%type;
cave result.ave%type;
cgrd result.grd%type;
begin
delete from result;
for i in c4 loop
	chap:= i.kor+i.eng+i.mat;
	cave := chap/3;
	if cave>= 90 then
		cgrd:='수';
	elsif cave>= 80 and cave<90 then
		cgrd:='우';
	elsif cave>= 70 and cave<80 then
		cgrd:='미';		
	elsif cave>= 60 and cave<70 then
		cgrd:='양';		
	else
		cgrd:='가';		
	end if;
	insert into result 
		values (i.name,i.kor,i.eng,i.mat,cave,chap,cgrd);	
	dbms_output.put_line
	 (i.name||i.kor||i.eng||i.mat||' '||cave||' '||chap||' '||cgrd);	
end loop;
commit;
end;
/




