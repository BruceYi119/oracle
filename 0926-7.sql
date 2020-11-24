declare
a sawon%rowtype;
begin
select * into a from sawon where sabun=7;
dbms_output.put_line(a.saname||a.sajob||a.sapay||a.sahire);
end;
/