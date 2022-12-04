create schema assignment12;
CREATE TABLE `customer` ( -- creaing the customer table to contain all the customer info
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer` VARCHAR(100) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`));
  
insert into customer(customer, phone_number) -- inserting the customs info into the table
values('Trevor Page', '226-555-4982');
insert into customer(customer, phone_number)
values('John Doe', '555-555-9498');

select * from customer;
-- --------------------------------------------------------------------------
CREATE TABLE `orders` ( -- creating a table for orders to identify each order
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`), 
  foreign key (`customer_id`) references customer(customer_id));
  
insert into orders(date_time, customer_id) -- insererting all the seperate orders
values('2014-09-10 9:47:00', 1),
('2014-09-10 13:20:00', 2),
('2014-09-10 9:47:00', 1);
INSERT INTO orders (date_time, customer_id) -- adding extra orders
VALUES ('2022-06-01 13:00:00', 1);

select * from orders;
-- --------------------------------------------------------------------------
CREATE TABLE `pizzas` ( -- creating a pizza table to contain different types of pizza
  `pizza_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NOT NULL,
  `price` DECIMAL(12,2) NULL,
  PRIMARY KEY (`pizza_id`));
  
    insert into pizzas (`type`, price)	-- created the pizzas table to contian all purchable pizzas
values('Pepperoni & Cheese', 7.99),
('Vegetarian', 9.99),
('Meat Lovers', 14.99),
('Hawaiian', 12.99);

select * from pizzas;
-- --------------------------------------------------------------------------
CREATE TABLE `orders_info`(
`order_info_id` INT NOT NULL auto_increment,
`order_id` INT NOT NULL,
`pizza_id` INT NOT NULL,
`amount`INT NOT NULL,
PRIMARY KEY (`order_info_id`),
FOREIGN KEY (order_id) REFERENCES orders(order_id), 
FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id) 
);

insert into orders_info(`order_id`, `pizza_id`, `amount`)
values (1,1,1),
(1,3,1),
(2,2,1),
(2,3,2),
(3,3,1),
(3,4,1);

insert into orders_info(`order_id`, `pizza_id`, `amount`) -- adding the extra order
values(4, 1, 1),
(4,4,1);


select * from orders_info;

-- --------------------------------------------------------------------------
select * from orders o 
join customer c on c.customer_id = o.customer_id;
-- Q3
select order_id as 'Order#', customer as Customer, phone_number as 'PhoneNumber', date_time as 'Date N Time' , `type` as 'Type' from customer c
join orders o on o.customer_id = c.customer_id
join pizzas p on p.pizza_id = o.order_id;
-- Q4
SELECT customer as 'Customer', sum(price) as Total FROM customer c
join orders o on o.customer_id = c.customer_id
join orders_info oi on o.order_id = oi.order_id
join pizzas p on p.pizza_id = o.order_id
group by customer;
-- Q5
select customer as Customer, DATE(o.date_time) as 'Date', sum(price) as 'Total' from customer c
join orders o on c.customer_id = o.customer_id
join orders_info oi on o.order_id = oi.order_id
join pizzas p on p.pizza_id = o.order_id
group by date_time;