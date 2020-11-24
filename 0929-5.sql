declare
	i number :=0;
begin
	loop
		dbms_output.put_line(i);
		i:=i+1;
		if i>=10 then
			exit;
		end if;
	end loop;
end;
/