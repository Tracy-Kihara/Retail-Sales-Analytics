set search_path to public;

select * from customers
limit 5;

select * from orders
limit 5;

-- SECTION A
-- Q1. Retrieve all customer records.
select * from customers;

-- Q2. Display customer names, cities, and segments.
select customer_name, city, customer_segment
from customers;

-- Q3. Find customers living in Nairobi.
select customer_name, customer_id, city
from customers
where city = 'Nairobi';

-- Q4. Find customers registered after January 1, 2025.
select distinct(customer_name), customer_id, registration_date
from customers
where registration_date > '2025-01-01';

-- Q5. Display all unique customer cities.
select distinct(city)
from customers;

-- Q6. Retrieve the 10 most recent orders.
select order_id, product_name
from orders
order by order_date desc
limit 10;

-- Q7. Find orders with unit prices above KSh 10,000.
select * from orders
where unit_price > 10000;

-- Q8. Find customers whose names start with A.
select * from customers
where customer_name like 'A%';

-- Q9. Retrieve orders with quantities between 2 and 5.
select *
from orders
where quantity between 2 and 5 ;

-- Q10. Find orders paid through M-Pesa.
select order_id, product_name, payment_method
from orders
where payment_method = 'M-Pesa';

-- SECTION B - Aggregate Functions
-- Q11. Count all customers.
select count(distinct customer_id) as total_customers
from customers;

-- Q12. Count all orders.
select count(*) as total_orders
from orders;

-- Q13. Calculate completed-order revenue.
select round(sum(quantity * unit_price * (1-discount/100)), 2) as total_revenue
from orders
where order_status = 'Completed';
 
-- Q14. Calculate the average completed-order value.
select round(avg(quantity * unit_price * (1-discount/100)), 2) as average_revenue
from orders
where order_status = 'Completed';


-- Q15. Find the highest and lowest product prices.
select  round(max(unit_price),2) as highest_price, 
		round(min(unit_price),2) as lowest_price
from orders;

-- Q16. Calculate revenue by product category.
select  product_category, 
		round(sum(quantity * unit_price * (1-discount/100)), 2) as total_revenue
from orders
where order_status = 'Completed'
group by product_category;

-- Q17. Count customers by city.
select city, count(distinct customer_id) as city_count
from customers
group by city;

-- Q18. Calculate quantity sold by product.
select product_name, sum(quantity) as total_quantity_sold
from orders
where order_status = 'Completed'
group by product_name;

-- Q19. Find categories generating more than KSh 100,000 in revenue.
select  product_category, 
		round(sum(quantity * unit_price * (1-discount/100)), 2) as category_revenue
from orders
where order_status = 'Completed'
group by product_category
having sum(quantity * unit_price * (1-discount/100)) > 100000;

-- Q20. Calculate the percentage of cancelled orders.
select (100.0 * count(*) filter (where order_status = 'Cancelled') / count(*)) as cancelled_percentage
from orders;

-- SECTION C - Joins
-- 21. Display orders with customer names and cities.
select order_id, customer_name, city
from orders o
left join customers c
on o.customer_id = c.customer_id;

-- Q22. Calculate total spending by customer.
select  c.customer_name, c.customer_id,
		round(sum(quantity * unit_price * (1-discount/100)), 2) as total_spending
from customers c
join orders o
on o.customer_id = c.customer_id
where order_status = 'Completed'
group by c.customer_name, c.customer_id
order by customer_id;

-- Q23. Identify customers who have never ordered
select c.customer_name, c.customer_id
from customers c
left join orders o
on o.customer_id = c.customer_id
where o.customer_id is null;

-- Q24. Find the 10 highest-spending customers.
select  c.customer_name, c.customer_id,
		round(sum(quantity * unit_price * (1-discount/100)), 2) as customer_spending
from customers c
join orders o
on o.customer_id = c.customer_id
where order_status = 'Completed'
group by c.customer_name, c.customer_id
order by customer_spending desc
limit 10;

-- Q25. Calculate revenue by customer city.
select city, round(sum(quantity * unit_price * (1-discount/100)), 2) as revenue
from customers c
join orders o
on o.customer_id = c.customer_id
where order_status = 'Completed'
group by city;

-- Q26. Identify customers with more than five orders.
select c.customer_name, c.customer_id, count(*) as order_count
from customers c
join orders o
on o.customer_id = c.customer_id
group by c.customer_name, c.customer_id
having count(*) > 5;

-- Q27. Calculate average customer spending by segment.
select c.customer_segment,
       round((sum(o.quantity * o.unit_price * (1 - o.discount / 100.0))
            / count(distinct c.customer_id)), 2) as avg_customer_spending
from customers c
join orders o on c.customer_id = o.customer_id
where o.order_status = 'Completed'
group by c.customer_segment
order by avg_customer_spending desc;
/* I first calculated all customers total(that is the summ of the quantity and price), then I found the average
  of those totals per customer_segment that is when you divide the total by the total customer count */

-- Q28. Identify the most popular category among VIP customers.
select product_category, sum(quantity) as total_quantity
from customers c
join orders o
using (customer_id)
where customer_segment = 'VIP'
group by product_category
order by total_quantity desc
limit 1;
-- My definition of most popular is based on the total number of quantity bought for a product

-- SECTION D - SUBQUERIES AND CTE's
-- Q29. Find customers spending above the average total spending per purchasing customer.
with customer_spending as (
    select c.customer_id, c.customer_name,
           round(sum(o.quantity * o.unit_price * (1 - o.discount / 100.0)),2) as total_spending
    from customers c
    join orders o using (customer_id)
    where o.order_status = 'Completed'
    group by c.customer_id, c.customer_name
)
select customer_id, customer_name, total_spending
from customer_spending
where total_spending > (select avg(total_spending) from customer_spending)
order by total_spending desc;

-- Q30. Find products priced above the overall average unit price.
with product_price as(
	select product_name, round(avg(unit_price),2) as product_avg_price
	from orders
	group by product_name
)
select product_name, product_avg_price
from product_price
where product_avg_price > (select avg(product_avg_price) from product_price)
order by product_avg_price desc;

-- Q31. Use a CTE to identify the three highest-revenue months.
with monthly_revenue as (
	select date_trunc('month', order_date):: date as order_month,   -- :: is used in place of cast as
	round(sum(quantity * unit_price * (1-discount/100)), 2) as revenue
	from orders
	where order_status = 'Completed'
	group by date_trunc('month', order_date)
)
select order_month, revenue
from monthly_revenue
order by revenue desc
limit 3;

-- Q32. Find customers purchasing from at least three categories.
with customer_purchase as(
	select customer_name, customer_id, count(distinct product_category) as purchase_count
	from orders o
	join customers c
	using (customer_id)
	where order_status = 'Completed'
	group by customer_name, customer_id
)
select customer_name, customer_id, purchase_count
from customer_purchase
where purchase_count >= 3
order by purchase_count desc;

-- Q33. Use a CTE to calculate category revenue, cost, profit, and profit margin.
with category_analysis as (
	select  product_category, 
			round(sum(o.quantity * o.unit_price * (1 - o.discount / 100.0)),2) as revenue,
			round(sum(o.quantity * o.cost_price),2) as cost
	from orders o
	where order_status = 'Completed'
	group by product_category),
category_profit as (
select  product_category, revenue, cost, (revenue - cost) as profit
	from category_analysis)
select product_category, revenue, profit, round((profit/revenue)*100,2) as profit_margin
	from category_profit;
		
/* Q34. Find customers whose latest completed order is more than 90 days before the latest order date in
    the dataset.   */
select * from orders;

with dataset_latest_order as (
	select max(order_date) as dataset_date
	from orders),
customer_max_date as(
select c.customer_name, o.customer_id, max(o.order_date) as customer_date
	from customers c
	join orders o using (customer_id)
	cross join dataset_latest_order
	where order_status = 'Completed'
	group by c.customer_name, o.customer_id
)
select customer_name, customer_id, customer_date, (max(orders.order_date) - customer_date) as difference 
from customer_max_date
where difference > 90;

-- SECTION E - WINDOW FUNCTIONS
-- Q35. Rank customers by spending using RANK()
with customer_spending as (
select customer_name, customer_id, round(sum(quantity * unit_price * (1-discount/100)), 2) as spending
		from customers c
		join orders o using (customer_id)
		where order_status = 'Completed'
		group by customer_name, customer_id
)
select customer_name, customer_id, spending, rank() over(order by spending desc) as spending_rank
from customer_spending;

		--Without using CTE
select c.customer_name, c.customer_id,
       sum(quantity * unit_price * (1-discount/100)) as spending,
       rank() over (order by sum(quantity * unit_price * (1-discount/100)) desc) as spending_rank
from customers c
join orders o on o.customer_id = c.customer_id
where order_status = 'Completed'
group by c.customer_id;

-- Q36. Number each customer's orders by recency using `ROW_NUMBER()`.
select customer_name, customer_id, order_date, row_number() over(order by order_date desc) as order_recency
from customers c
join orders o using (customer_id)
group by c.customer_name, customer_id, order_date;

-- Q37. Rank products within categories using `DENSE_RANK()`.
select  product_name, product_category, sum(quantity * unit_price * (1-discount/100)) as revenue,
		dense_rank() over(partition by product_category  
		order by sum(quantity * unit_price * (1-discount/100)) desc) as revenue_ranking
from orders
group by product_name, product_category;

-- Q38. Calculate cumulative monthly revenue.
with revenue as (
select  date_trunc('month', order_date)::date as month, 
		sum(quantity * unit_price * (1-discount/100)) as monthly_revenue
	from orders
	where order_status = 'Completed'
	group by date_trunc('month', order_date)::date
)
select  to_char(month, 'YYYY-MM') as month, monthly_revenue,
		sum(monthly_revenue) over (order by month) as cumulative_revenue
from revenue;

-- Q39. Compare monthly revenue using `LAG()`.
with revenue as (
select  date_trunc('month', order_date)::date as month, 
		sum(quantity * unit_price * (1-discount/100)) as current_month_revenue
	from orders
	where order_status = 'Completed'
	group by date_trunc('month', order_date)::date
)
select month, current_month_revenue, lag(current_month_revenue) over(order by month) as previous_month_revenue
from revenue;

-- Q40. Calculate month-over-month revenue growth (%).
with revenue as (
select  date_trunc('month', order_date)::date as month, 
		sum(quantity * unit_price * (1-discount/100)) as revenue
	from orders
	where order_status = 'Completed'
	group by date_trunc('month', order_date)::date
)
select month, revenue, lag(revenue) over(order by month) as previous_revenue, 
		round((revenue - lag(revenue) over (order by month))
        / nullif(lag(revenue) over (order by month), 0) * 100, 2) as revenue_growth
from revenue;

-- Q41. Divide customers into four spending groups using `NTILE(4)`
with spending_groups as (
select customer_name, customer_id, sum(quantity * unit_price * (1-discount/100)) as spending
	from customers c
	join orders o using (customer_id)
	where order_status = 'Completed'
	group by customer_name, customer_id
)
select customer_name, customer_id, spending, ntile(4) over(order by spending desc)
from spending_groups;

-- Q42. Calculate each category's share of total revenue using window functions.
with category_revenue as (
	select product_category, round(sum(quantity * unit_price * (1-discount/100)), 2) as revenue
	from orders
	where order_status = 'Completed'
	group by product_category
)
select  product_category, revenue, round(revenue/sum(revenue) over () * 100, 2) as revenue_share
from category_revenue;

-- SECTION F - ADVANCED BUSINESS INTELLIGENCE
-- Q43. Create a `monthly_sales_summary` view (month, orders, revenue, cost, profit). Then `SELECT` from it.
create or replace view monthly_sales_summary  as
	select date_trunc('month', order_date)::date as month, 
	count (distinct order_id) as orders,
	sum(quantity * unit_price * (1-discount/100)) as revenue,
	sum(quantity * cost_price) as cost,
	sum(quantity * unit_price * (1-discount/100)) - (sum(quantity * cost_price)) as profit
from orders
where order_status = 'Completed'
group by date_trunc('month', order_date)::date;	
	
select * from monthly_sales_summary;

/* Q44. Create a PostgreSQL function that returns completed-order revenue for a supplied customer ID. Show
    it working for one customer **and** for an ID that does not exist (it should return 0, not NULL).*/
create or replace function customer_revenue(p_customer_id int)
returns numeric
language plpgsql
as $$
begin
return coalesce(
        (select round(sum(quantity * unit_price * (1 - discount / 100.0)), 2)
         from orders
         where customer_id = p_customer_id and order_status = 'Completed'), 0);
end;
$$;

select customer_revenue(2); -- an existing customer_id

select customer_revenue(250); -- a non-existing customer _id	

-- Q45. Segment customers into High, Medium and Low Value. **Explain why you chose your thresholds** 
with customer_spending as (
    select customer_id, sum(quantity * unit_price * (1 - discount / 100.0)) as total_spent
    from orders
    where order_status = 'Completed'
    group by customer_id),
thresholds as (
    select
        percentile_cont(0.75) within group (order by total_spent) as p75,
        percentile_cont(0.25) within group (order by total_spent) as p25
    from customer_spending)
select c.customer_id, round(c.total_spent, 2) as total_spent,
    case when c.total_spent >= t.p75 then 'High'
         when c.total_spent >= t.p25 then 'Medium'
         else 'Low'
end as value_segment
from customer_spending c
cross join thresholds t
order by c.total_spent desc;
/*I chose to use percentiles because they are based on the actual spending distribution therefore, 
	segments stay balanced and update automatically as new orders are loaded.	*/
 
/* Q46. Produce a management report: the top five customers, top five products, the most profitable
    category, and the lowest-revenue month.		*/
with sales as (
    select customer_id, customer_name, product_name, product_category,
        date_trunc('month', order_date)::date as month,
        quantity * unit_price * (1 - discount / 100.0) as revenue,
        quantity * cost_price as cost
    from orders
    join customers using (customer_id)
    where order_status = 'Completed'
),
top_customers as (
    select 1 as section_no, 'top 5 customers (by revenue)' as report_section,
        row_number() over (order by sum(revenue) desc) as rank_no,
        customer_name::text as item,
        round(sum(revenue), 2) as amount
    from sales
    group by customer_id, customer_name
    order by amount desc
    limit 5
),
top_products as (
    select
        2, 'top 5 products (by revenue)',
        row_number() over (order by sum(revenue) desc),
        product_name,
        round(sum(revenue), 2) as amount
    from sales
    group by product_name
    order by amount desc
    limit 5
),
top_category as (
    select 3, 'most profitable category (by profit)', 1,
        product_category, round(sum(revenue) - sum(cost), 2) as amount
    from sales
    group by product_category
    order by amount desc
    limit 1
),
lowest_month as (
    select
        4, 'lowest-revenue month', 1, to_char(month, 'YYYY-MM'),
        round(sum(revenue), 2) as amount
    from sales
    group by month
    order by amount asc
    limit 1
)
select * from top_customers
union all
select * from top_products
union all
select * from top_category
union all
select * from lowest_month
order by section_no, rank_no;