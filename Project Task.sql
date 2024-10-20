use project1;
#1#
select*from customer where city="new york" or grade>100;

#2#
select*from salesman where commission between 0.12 and 0.14 order by commission;

#3#
select*from customer where customer_name like "%n";

#4#
select*from salesman where namess like "N%%%l%";

#5#
select*from customer where grade is null;

#6#
select sum(purch_amt)from orders;

#7#
select count(salesman_id) from orders group by salesman_id;

#8#
select city,max(grade)from customer group by city; 

#9#
select customer_id,max(purch_amt) from orders group by customer_id having max(purch_amt);

#10#
select*from orders;
select*from salesman;
select customer_id,order_date,max(purch_amt) from orders group by customer_id,order_date having max(purch_amt);

#11#
select salesman_id,order_date,max(purch_amt) from orders group by salesman_id having order_date="2016-08-17";

#12#
select customer_id,order_date,max(purch_amt) from orders group by customer_id,order_date having max(purch_amt)>2000;

#13#
select order_date,count(order_no) from orders where order_date="2016-08-17";

#14#
select distinct salesman_id from salesman;

##Query 15## find the name and city of those customers and salesman who lives in the same city#
select*from customer;
select*from salesman;
select customer_name,namess,city from salesman,customer where city=citys;

#Query 16# find the names of all customers along with the salesman who works for them
select *from customer;
select*from salesman;
select customer.customer_name,salesman.namess from customer join salesman where customer.c_salesman_id=salesman.salesman_id; 

#Query 17# Display all those orders by the customers not located  in the same cities where their salesmen live.
select * from orders;
select order_no,customer_name,orders.customer_id,salesman.salesman_id from customer,orders,salesman where city<>citys and orders.customer_id=customer.customer_id and orders.salesman_id=salesman.salesman_id; 

#Query 18# Display the salesman 'Paul Adam' from the orders
select *from customer;
select*from salesman;
select*from salesman where salesman_id=(select salesman_id from salesman where namess="Paul Adam");


#Query 19# Display all the orders which values are greater than the average order values 10th oct 2016
select*from orders;
select*from orders where purch_amt>(select avg(purch_amt) from orders where order_date="2016-10-10");

#Query 20#  find all orders attributed to salesmen in Paris.
select*from salesman;
select*from salesman where salesman_id in (select salesman_id from salesman where citys="paris"); 

#Query 21# display only those customers whose grade are, in fact, higher than every customer in New York
select*from customer where grade>all(select grade from customer where city="New York"); 


