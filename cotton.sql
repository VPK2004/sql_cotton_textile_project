create database project1;
use project1;
desc salesman;
create table salesman(salesman_id int,name varchar(20),city varchar(20),commission decimal(3,2));
alter table salesman add primary key(salesman_id);
insert into salesman values(5001,"James hood","New york",(0.15)),(5002,"Nail Knito","Paris",(0.13)),(5003,"Pit Alex","London",(0.11));
insert into salesman values(5006,"Mc Lyon","Paris",(0.14)),(5005,"Lauson Nen","",(0.12)),(5007,"Paul Adam","Rome",(0.13));
update salesman set salesman_id=5005 where city="London";
update salesman set salesman_id=5006 where city="";
update salesman set salesman_id=5003 where city="Paris";
update salesman set salesman_id=5005 where city="London";
update salesman set salesman_id=5002 where name="Nail Knito";
update salesman set city="Paris" where salesman_id=5006;
update salesman set city="" where salesman_id=5003;
update salesman set commission=0.14 where salesman_id=5006;
update salesman set commission=0.12 where salesman_id=5003;
select*from salesman;
alter table salesman modify salesman_id int primary key;
update salesman set city="paris" where salesman_id=5003;
update salesman set city="" where salesman_id=5006;
update salesman set city="paris" where salesman_id=5002;
------------------------
use cottoncompany;
create table customer(customer_id int,customer_name varchar(20),city varchar(20),grade int,salesman_id int);
select*from customer;
insert into customer(customer_id,customer_name,city) values(3001,"brad guman","london");
insert into customer values(3004,"fabian johns","paris",300,5006),(3007,"brad davis","new york",200,5001);
insert into customer(customer_id,customer_name,city,grade) values(3009,"geoff camero","berlin",100);
insert into customer values(3008,"julian green","london",300,5002),(3003,"altidor","monoow",200,5007);
select*from customer;
-------------------------------------------
use cottoncompany;
desc orders;
select*from orders;
create table orders(order_no int,purch_amt decimal(6,2),order_date date,customer_id int,salesman_id int);
insert into orders values(7001,(130.5),"2016-10-05",3005,5002);
update orders set order_no=70001 where salesman_id=5002;
insert into orders(order_no,purch_amt,order_date,customer_id)values(70009,(270.65),"2016-09-10",3001);
insert into orders values(70002,(65.26),"2016-10-05",3002,5001);
insert into orders(order_no,purch_amt,order_date,customer_id)values(70004,(110.5),"2016-08-17",3009);
insert into orders values(70007,(948.5),"2016-09-10",3005,5002);
insert into orders values(70005,(2400.6),"2016-07-27",3007,5001),(70008,(5760),"2016-09-10",3002,5001);
insert into orders values(70010,(1963.43),"2016-10-10",3004,5006);
insert into orders(order_no,purch_amt,order_date,customer_id)values(70003,(2480.4),"2016-10-10",3009);
insert into orders values(70012,(250.45),"2016-06-27",3008,5002),(70011,(72.29),"2016-08-17",3003,5007);
select*from orders;
select*from customer;

select*from orders;
desc orders;
update orders set purch_amt=75.29 where order_no=70011;
-------------------------------------
ALTER TABLE Orders
ADD FOREIGN KEY (salesman_id) REFERENCES Persons(salesman_ID);
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (salesman_ID) REFERENCES Persons(salesman_ID);
alter table customer drop foreign key fk_PersonCustomer;
desc salesman;
desc customer;
desc orders;

alter table orders modify column  salesman_id int primary key;

update orders set salesman_id=5025 where order_no=70012;

delimiter &&
create procedure pandya()
begin
select * from salesman;
end &&
delimiter ;
call pandya;

select*from salesman;
select*from orders;
select*from customer;

delimiter &&
create procedure guru(in fun int )
begin
select max(purch_amt) from orders where purch_amt>fun ;
end &&
delimiter ;
call guru(250);

select*from customer;

delimiter &&
create procedure cus(in man int,out van int)
begin
select sum(grade) into van from customer where customer_id=man;
end &&
delimiter ;
call cus(3003,@van);
select @van;
drop procedure cus;


call guru(900);
select @van as Grade;


delimiter ;