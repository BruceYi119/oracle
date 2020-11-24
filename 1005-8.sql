set verify off
set serveroutput on
accept no prompt '사원번호='
declare
ppname personnel.pname%type;
ppay personnel.pay%type;
begin
select pname,pay into ppname,ppay from personnel where pno=&no;
dbms_output.put_line(ppname||' '||ppay);
exception
	when no_data_found then
		dbms_output.put_line('해당 사원이 없습니다.');
	when too_many_rows then
		dbms_output.put_line('사원이 두명 이상 입니다.');
	when others then
		dbms_output.put_line('관리자에게 문의하세요.');	
		
end;
/






