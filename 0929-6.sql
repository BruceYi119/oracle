set verify off
accept no prompt '사번='
declare
	pname sawon.saname%type;
	ppay sawon.sapay%type;
begin
	select saname,sapay into pname,ppay 
		from sawon where sabun=&no;
	dbms_output.put_line(pname||'의 급여는 '||ppay);
end;
/


