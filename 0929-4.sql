declare
	i number :=0;
begin
	while i<10 loop
		dbms_output.put_line(i);
		i:=i+1;
	end loop;
end;
/