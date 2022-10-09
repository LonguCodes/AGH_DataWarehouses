use lab1;

-- Ex1

select avg(price)
from dbo.orders
         left join order_details od on orders.order_id = od.order_id
         left join pizzas p on od.pizza_id = p.pizza_id
where date = Cast('2015-02-18' as date);

-- Ex2

select distinct orders.order_id
from orders
         left join order_details od on orders.order_id = od.order_id
         left join pizzas p on od.pizza_id = p.pizza_id
         left join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
where ingredients not like '%Pineapple%'
  and Datename(MONTH, date) = 'March'
  and DATENAME(year, date) = 2015;

-- Ex3

with order_with_prices as (select sum(price)      as total_price,
                                  orders.order_id as order_id
                           from orders
                                    left join order_details od on orders.order_id = od.order_id
                                    left join pizzas p on od.pizza_id = p.pizza_id
                           where datename(month, date) = 'February'
                           group by orders.order_id)
select top 10 order_id, rank() over ( order by total_price desc )
from order_with_prices;

-- Ex4
with price_by_order as (select orders.order_id as order_id, sum(price) as total, orders.date as date
                        from orders
                                 left join order_details od on orders.order_id = od.order_id
                                 left join pizzas p on od.pizza_id = p.pizza_id
                        group by orders.order_id, orders.date),
     average_by_month as (select datename(month, orders.date) as month,
                                 datename(year, orders.date)  as year,
                                 avg(total)                   as average
                          from orders
                                   left join price_by_order on price_by_order.order_id = orders.order_id
                          group by datename(month, orders.date), datename(year, orders.date))
select order_id, total as order_amount, average as average_month_amount, date
from price_by_order
         left join average_by_month
                   on average_by_month.month = datename(month, date) and average_by_month.year = datename(year, date)

-- Ex5

select count(order_id) as order_count, date, left(time, 2) as hour
from orders
where date = '2015-01-01'
group by left(time, 2), date
order by left(time, 2)

-- Ex6

select count(orders.order_id) as amount, pt.name, pt.category
from orders
         left join order_details od on orders.order_id = od.order_id
         left join pizzas p on od.pizza_id = p.pizza_id
         left join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
where datename(month, date) = 'January'
  and datename(year, date) = 2015
group by pt.name, pt.category
order by amount desc;

-- Ex7

select count(orders.order_id) as amount, p.size
from orders
         left join order_details od on orders.order_id = od.order_id
         left join pizzas p on od.pizza_id = p.pizza_id
where (datename(month, date) = 'February' or datename(month, date) = 'March')
  and datename(year, date) = 2015
group by p.size
order by p.size;