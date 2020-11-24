set verify off
accept no prompt '사원번호='
declare
ppay personnel.pay%type;
begin
select pay into ppay from personnel where pno=&no;
if ppay<=1000 then
	update personnel set bonus=ppay*0.1 where pno=&no;
elsif ppay>=1001 and ppay<2000 then
	update personnel set bonus=ppay*0.15 where pno=&no;
elsif ppay>=2001 and ppay<3000 then
	update personnel set bonus=ppay*0.2 where pno=&no;
else
	update personnel set bonus=ppay*0.25 where pno=&no;
end if;
end;
/




