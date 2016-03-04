delimiter //

create procedure displaycost() 
begin 
select productid,total_sell as Total_Revenew_Earned,total_quantity as Toal_Products_Sold from display where id=0;
end;//




create procedure totalcost(in checkid int)   
begin   
declare total float default 0; 
declare total1 float default 0;   
declare cc float default 0;  
declare totalquan int default 0; 
declare quan int default 0; 
declare done int default 0; 
declare tpr float default 0;
declare cost_cur cursor for select cost,quantity from orders where productid=checkid; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;   
block2: 
  begin
  declare pr cursor for select profit from productname where id=checkid;
  open pr; 
  curloop:loop 
    fetch from pr into tpr;
    leave curloop;
    close pr;
  end loop curloop;
end block2;  
open cost_cur;  
cursorfetch:loop  
  fetch from cost_cur into cc,quan; 
  if done=0 then 
    set total1 = tpr*quan; 
    set total=total+total1;
    set totalquan=quan+totalquan;  
  else   
    update display set productid=checkid,total_quantity=totalquan,total_sell=total where id=0;   
    call displaycost();  
    leave cursorfetch;  
  end if; 
end loop cursorfetch;  
close cost_cur;
end;//
