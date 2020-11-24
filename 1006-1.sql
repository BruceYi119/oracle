set serveroutput on
set verify off
accept no prompt '사번=>'
accept sal prompt '급여=>'
declare
vpno personnel.pno%type;
vpay personnel.pay%type;
vpname personnel.pname%type;
minpay exception;
begin
	if &sal<2000 then
		raise minpay;
	end if;
	select pno,pay,pname into vpno,vpay,vpname 
		from personnel where pno=&no;
	update personnel set pay=&sal where pno=&no;
	dbms_output.put_line(vpname||'의 급여가 '||&sal||'로 수정됨');
	exception
		when no_data_found then
			dbms_output.put_line('해당 사원없음');		
		when too_many_rows then
			dbms_output.put_line('사원이 두명이상');	
		when minpay then
			dbms_output.put_line('급여를 확인하세요');					
end;
/

