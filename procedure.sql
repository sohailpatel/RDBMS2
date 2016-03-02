delimiter //

create procedure displaycost() begin select productid,total_sell from display where id=0;end;//


create procedure totalcost(in checkid int)  begin  declare total float default 0;  declare cc float default 0; declare done int default 0;declare cost_cur cursor for select cost from orders where productid=checkid;DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;  open cost_cur; cursorfetch:loop fetch from cost_cur into cc;if done=0 then set total = cc+total; update display set total_sell=total where id=0; update display set productid=checkid where id=0; else call displaycost(); leave cursorfetch; end if;end loop cursorfetch; close cost_cur; set done=0;end;//

