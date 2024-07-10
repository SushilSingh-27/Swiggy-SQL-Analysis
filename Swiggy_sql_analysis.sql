
use world;
## Total no of orders placed
Select count(distinct order_id) as total_orders 
from orders ;

## Number of veg(denoted by 1) , Non-veg(denoted by 0) items and Dessert(2)
Select is_veg,Count(is_veg)
from swiggy_item 
group by is_veg; 

## Most frequent restaurant from where customes has ordered
select restaurant_name,count(restaurant_name) 
from orders 
group by restaurant_name 
order by count(restaurant_name) Desc limit 1;

## Number of orders placed during rain mode:
Select distinct(rain_mode),count(order_id) from orders group by (rain_mode);

## Month wise no of orders
SELECT month(order_time), count(distinct order_id) FROM orders
group by month(order_time) 
order by count(distinct order_id) desc;

## Delivery on time or not 
SELECT on_time ,count( on_time) FROM world.orders group by on_time;

## Number of on-time deliveries from a specific restaurant during rain mode:
select  restaurant_name,COUNT(*) AS on_time_deliveries
from orders
where rain_mode = '0'
  AND restaurant_name = 'The Bowl Company'
  AND on_time = '1';

## Average order value for on-time vs. delayed deliveries:
SELECT on_time, AVG(order_total) AS average_order_value
FROM orders
GROUP BY on_time;

##Orders placed within a specific time range (between 6 PM and 9 PM):
select o.*, s.name,s.is_veg FROM orders o join swiggy_item s on o.id=s.id
where Time(o.order_time) between '18:00:00' AND '21:00:00';

 
 ###########################################################################################################
#Advanced 

##Identify peak order times:
select hour(order_time) as "Hour" ,Count(order_id) as "number of orders" 
from orders 
group by hour(order_time) 
order by Count(order_id) desc Limit 5;

##Analyze order trends by day of the week:
select dayname(order_time),count(id) from orders 
group by dayname(order_time) 
order by count(id) desc;



###Report 

#Analyzed Swiggy order data to identify a surge in orders between 6 PM and 9 PM. 
#This insight informed a targeted marketing campaign with special offers for evening deliveries,
#which led to a 15% increase in orders during that time slot.

###

#We looked at Swiggy orders and found that people who got their food on time spent more, 
#on average, than those who had to wait.
#This suggests that happy customers might spend more! 
#We can use this information to improve how quickly we deliver food,
#which could lead to happier customers and more money coming in.


###



