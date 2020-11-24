declare
    cursor cur is select pname, pay from personnel;
    vbonus number;
begin
    for i in cur loop
		case
			when i.pay <= 1000 then
				vbonus := i.pay * 0.1;
			when i.pay > 1000 and i.pay < 2000 then
				vbonus := i.pay * 0.15;
			when i.pay > 2000 and i.pay < 3000 then
				vbonus := i.pay * 0.2;
			else
				vbonus := i.pay * 0.25;
        end case;
        DBMS_OUTPUT.PUT_LINE('이름 : ' || i.pname || ', 보너스 : ' || i.pay);
    end loop;
end;
/