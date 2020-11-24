declare
	i number := 17;
begin
	if i>10 then
		dbms_output.put_line('i값은 10보다 큼');
	else
		dbms_output.put_line('i값은 10보다 작음');	
	end if;
end;
/