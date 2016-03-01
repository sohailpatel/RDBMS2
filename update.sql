
create table userid(id int primary key AUTO_INCREMENT,password varchar(50),type int);
create table userdetails(id int,name varchar(50),email varchar(50));
create table type(id int,typeis varchar(10));
create table products(id int primary key,price float,selleris int,colorid int);
 create table productname(id int,name varchar(50));
create table orders(id int,productid int,quantity int,cost float,orderdate date,orderby int);



create trigger updateproduct after update on products for each row begin update productname set id=new.id where id=old.id; end; //

create trigger updateorders after update on productname for each row begin update orders set productid=new.id where productid=old.id; end; //

create procedure totalcost(in checkid int)  begin  declare total float default 0;  declare cc float default 0; declare cost_cur cursor for select cost from orders where productid=checkid; open cost_cur; loop  fetch from cost_cur into cc;set total = cc+total; update display set total_sell=total where id=0; select total_sell from display; end loop; close cost_cur; end;//
