# Duka Smart Electronics: SQL Retail Analytics

## Overview
This is a PostgreSQL case study that turns raw sales records from a Kenyan electronics retailer into clear answers about customers, products, profit and cancellations.

| | |
|---|---|
| **Category** | Data Analytics |
| **Database** | retail_analytics (schema: `public`) |
| **SQL client** | DBeaver |
| **Data size** | 150 customers, 800 orders |
| **Difficulty** | Beginner to advanced |

---

## Table of Contents
1. [About the Company]
2. [The Problem]
3. [What This Project Sets Out to Do]
4. [Tech Stack]
5. [Data Model]
6. [SQL Skills Covered]
7. [How the Numbers Are Calculated]
8. [Results]
9. [Repository Contents]
10. [Final Thoughts]

---

## About the Company
Duka Smart Electronics, a Kenyan electronics retailer with branches in ten towns is the subject of this report. It looks at how customers spend, how they can be grouped, which products and categories perform best, why orders get cancelled, and which customers have gone quiet with the aim of showing where the business makes its money and where it is vulnerable.


## The Problem
As the retailer expands, the company needs a dependable view of who its best customers are, which products earn the most and where money is being lost. Without a structured analysis, it is hard to:

- spot the customers who bring in the most revenue
- see which products drive sales
- understand why orders are cancelled 
- notice customers who have quietly stopped buying.

This project answers those questions with SQL and closes with recommendations management can act on.

## What This Project Sets Out to Do
- - Calculate the share of orders that end in cancellation.
- Find the products that earn the most revenue.
- Compare revenue, cost, profit and margin across product categories.
- Study how customers buy and how much they spend.
- Track monthly sales and how revenue grows or shrinks over time.
- Classify customers into spending groups based on their revenue contribution using percentiles
- Flag customers whose buying has dropped off.
- Use advanced SQL features to answer the harder business questions.
- Turn the findings into practical advice for management.

## Tech Stack

| Tool | Role |
|---|---|
| PostgreSQL | Storing the data and running the analysis |
| DBeaver | Writing and testing queries |
| GitHub | Hosting the code and version history |
| Markdown | Writing up the documentation and insights |

## Data Model

The project is organized in the `retail_analytics` database under the `public` schema.  There are only two tables that are used in the analysis that is:
      1. `Customers` which holds each customer's ID, name, gender, location, registration_date and segment.
      2. `Orders` which oorder_id, customer who made the order, order dates, products, categories, quantities, prices, costs, discounts and statuses.

I have included a detailed SQL script named `script.sql` in my GitHub repository, which contains the queries required to create the database and tables, as well as insert the relevant data into the tables.

## SQL Skills Covered

The project works through 46 business questions arranged from easy to difficult.

**1. SQL Fundamentals**
- Retrieving rows with `select`
- Filtering with `where`, `like` and `between`
- Ordering with `order by`
- Narrowing down by order status and payment method

**2. Aggregation and Grouping**
- `count()`, `sum()`, `avg()`, `min()`, `max()`
- Revenue, cost, profit and margin
- `group by` and `having`

**3. Joins**
- `inner join` and `left join`
- Spend per customer, per segment and per location
- How often customers buy
- Customers who have no matching orders

**4. Subqueries and CTEs**
- Common table expressions
- Comparing customers against average spend
- Finding potentially inactive customers

**5. Window functions**
- `rank()`, `row_number()`, `dense_rank()`, `ntile()`
- Running revenue totals with `sum() over()`
- Month-over-month change with `lag()`
- Revenue share and category rankings

**6. Advanced business intelligence**
- A reusable monthly sales summary view
- A customer revenue function written in PL/pgSQL
- Customer segmentation
- A business report aimed at management

## How the Numbers Are Calculated

| Metric | Formula |
|---|---|
| Revenue (after discount) | `quantity * unit_price * (1 - discount / 100.0)` |
| Total cost | `quantity * cost_price` |
| Profit | `revenue - total_cost` |
| Profit margin (%) | `(profit / nullif(revenue, 0)) * 100` |

**Which orders count?**
- Sales and customer revenue figures use only orders with the status `Completed`.
- The cancellation rate uses every order on record therefore, cancelled orders stay in the denominator.

**Inactive customers.** A customer's most recent completed order is compared with the most recent order date anywhere in the dataset. If the gap is more than 90 days, the customer is treated as potentially inactive.

## Results

### Customers
- Brian Chebet was the highest spender having spent ksh 848,118 total worth of completed orders revenue.
-  The top five highest spending customers contributed approximately KSh 3.81 million representing 16% of total completed order revenue.
-  VIP customers had the highest average spending at KSh 253,251.88, followed by Corporate customers at KSh 197,958.71 and Retail customers at KSh 163,575.
- Retail customers generated the highest total revenue of KSh 14.39 million. - Corporate customers had the highest profit margin at 15.25%.
- 47 customers had not made a recent purchase.

### Products
- The Iphone 23 was the best seller in terms of revenue generation among all the products.
- The JBL flip 6 speaker has the highest profit margin of 23.53%
- Among categories, Accessories has the highest profit margin but the lowest total profit showing strong profitability but low sales volume .
- Mobile Phones and Computing contribute the most to total profit.

### Monthly revenue and Margin
- August 2026 recorded the highest revenue at KSh 2,242,033.90
- January 2026 had the lowest revenue at KSh 322,432.95.
- Sales growth are inconsistent as they vary from month to month

### Location Performance
- Nairobi generated the highest revenue at KSh 9.58 million
- Mombasa ranked second at KSh 3.16 million.
- Machakos generated the least revenue of 745,099

### Orders Cancellation
- 90 of 800 orders were cancelled giving a cancellation rate of 11.25%.

## Repository Contents

- `README.md` - what the project is, how to set it up, how to run your queries
- `schema.sql` - containing the create table statements
- `queries.sql`- with all business questions and their queries
- `insights.md` - detailed findings and  recommendations
-  `screenshots` - 1 page dashboard

## Final Thoughts

This project shows how PostgreSQL can be used to solve real retail problems. It starts with simple queries and aggregations, then moves on to joins, CTEs, subqueries, window functions and reusable database objects. Along the way, raw transactions become insights about customer value, product performance, profitability and cancellations that management can use to make decisions.