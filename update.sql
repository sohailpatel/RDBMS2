
create table userid(id int primary key AUTO_INCREMENT,password varchar(50),type int);
create table userdetails(id int,name varchar(50),email varchar(50));
create table type(id int,typeis varchar(10));
create table products(id int primary key,price float,selleris int,colorid int);
create table productname(id int,name varchar(50));
create table orders(id int,productid int,quantity int,cost float,orderdate date,orderby int);



 insert into userid(password,type) values("123456789",1);
 insert into userid(password,type) values("123456789",2);
 insert into userid(password,type) values("123456789",2);
 insert into userid(password,type) values("123456789",1);
 insert into userid(password,type) values("123456789",1);

insert into userdetails values(1,"abc","abc@gmail.com");
insert into userdetails values(2,"pqr","pqr@gmail.com");
insert into userdetails values(3,"xyz","xyz@gmail.com");
insert into userdetails values(4,"def","def@gmail.com");
insert into userdetails values(5,"qef","qef@gmail.com");


 insert into type values(2,"buyer");
 insert into type values(1,"seller");
 

insert into products values(1,10,1,1);
insert into products values(2,40,4,2);
insert into products values(3,200,5,1);

 insert into productname values(1,"pen");
 insert into productname values(2,"book");
 insert into productname values(3,"pen_set");


insert into orders values(1,1,2,20,"2016-02-02",3);
insert into orders values(2,1,1,10,"2016-02-02",2);
insert into orders values(3,2,1,40,"2016-02-03",2);
insert into orders values(4,2,2,80,"2016-01-01",3);
insert into orders values(5,2,1,40,"2016-02-04",2);
insert into orders values(6,2,3,120,"2016-02-13",2);
insert into orders values(7,3,1,200,"2016-02-03",5);
insert into orders values(1,3,1,200,"2016-02-20",5);




delimiter //


create trigger updateproduct after update on products for each row begin update productname set id=new.id where id=old.id; end; //

create trigger updateorders after update on productname for each row begin update orders set productid=new.id where productid=old.id; end; //



