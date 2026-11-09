# Duka Smart Electronics: Retail Analytics

## Project overview
Duka Smart Electronics, a Kenyan electronics retailer with branches in ten towns is the subject of this report. It looks at how customers spend, how they can be grouped, which products and categories perform best, why orders get cancelled, and which customers have gone quiet with the aim of showing where the business makes its money and where it is vulnerable.

The central finding is that Duka Smart moves a lot of stock but retains very little of the income. Completed orders brought in KSh 24.16 million in revenue of which only KSh 2.89 million was profit, a margin of 11.97%..

The sample dataset contains **150 customers** and **800 orders** dated from **January 2025** through **September 2026**.
All financial amounts are in Kenyan shillings (KSh).
It is important to note that the financial figures are for **completed orders only** unless stated otherwise.

## Highlights
- **Category margins** Accessories achieved the highest profit margin at 42.39% above the rest of the portfolio.
- **Top category by value** Mobile Phones led in both revenue and profit, generating KSh 6,942,060.65 in revenue and KSh 728,760.65 in profit.
- **Market concentration** Nairobi is the largest market contributing KSh 9,581,980.35, or about 39.67% of completed order revenue.
- **Order cancellations** 90 of 800 orders were cancelled resulting to an overall cancellation rate of 11.25%.
- **Monthly performance** September 2026 revenue fell 6.67% compared with August, the previous month although the profit margin improved.
- **Customer inactivity** 47 of the 132 customers with a completed purchase (about 35.6%) placed no completed order in the 90 days before the dataset's latest order date.

## Business insights and recommendations
### 1. Customer Analytics
#### 1.1 Customer Spending
Customer spending was measured by totalling each customer’s revenue from completed orders with discounts already deducted.

The table below showcases the top 5 customers by their spending

| Rank | Customer | Spending (KSh) |
|---:|---|---:|
| 1 | Brian Chebet | 848,118.75 |
| 2 | Peter Ndungu | 790,229.50 |
| 3 | Lucy Njoroge | 767,880.80 |
| 4 | Nancy Korir | 702,545.75 |
| 5 | Purity Ochieng | 698,921.60 |

**Findings**
- The top five highest spending customers contributed approximately KSh 3.81 million representing 16% of total completed order revenue.
- Brian Chebet was the highest spender having spent ksh 848,118.

**Recommendations**
- Offer retention benefits to the top spenders such as priority service or loyalty rewards.
- Track purchase frequency and spending for these customers so that a decline is spotted early.
- Attract more customers and grow sales to reduce reliance on a few high-spending customers.

#### 1.2 Customer Segments
- Customers were ranked by total completed order revenue and grouped into 3 segments by the percentile rule that is the top 25% are High Value, the middle 50% Medium Value and the bottom 25% Low Value.

| Segment | Revenue | 
|---:|---:|
| High Value | Ksh 255,253 and above|
| Medium Value |Between 35,202 - 255,252 |
| Low Value | Below 35,202 |

| Segment | Percentile Band | Customers |
|---:|---|---:|
| High Value | Top 25% | 33 |
| Medium Value | Middle 50% | 66 |
| Low Value | Bottom 25% | 33 |
| No Completed Orders| Not Segmented| 18|

**Findings**
- The database holds 150 customers. The 18 without a completed order are outside the segmentation because the focus was only on customers who have a purchase.
- Segmentation helps management understand customer spending patterns and make informed decisions on retention strategies. High value customers should be prioritised for retention, medium value customers encouraged to increase their spending while lowvalue customers should be monitored to identify opportunities for growth.

**Recommendations**
- Concentrate retention effort on High Value customers.
- Encourage Medium Value customers to spend more through targeted promotions and special offers.
- Review the 18 customers with no completed order to see whether their orders were cancelled and whether those sales could have been saved.
- Re-run the customer segmentation regularly to track changes in customer value and spending patterns.

#### 1.3 Customer Grouping
- Customers were divided in 3 groups that is, VIP, Retail and Corporate.

**Findings**
- VIP customers had the highest average spending at KSh 253,251.88, followed by Corporate customers at KSh 197,958.71 and Retail customers at KSh 163,575.21. Retail generated the highest total revenue of KSh 14.39 million. Corporate customers had the highest profit margin at 15.25%.

**Recommendations**
- Offer Corporate customers tailored product bundles and better account support.
- Review VIP pricing and discounts to improve profit margins.
- Introduce loyalty rewards to encourage repeat purchases among Retail customers.

#### 1.4 Customer Inactivity
Each customer's most recent completed purchase was compared with the latest order date in the dataset. Customers who had not made a purchase in over 90 days were classified as potentially inactive.

**Findings**
- 47 customers had not made a recent purchase. Customers who had never completed an order were excluded.
-47 customers have not purchased recently. Also, electronics are not purchased often hence some of the customers may simply be taking longer before making another purchase.
- A 90 day gap signals risk rather than confirmed churn, so the 47 customers are best treated as a list to prioritise, not as lost customers.

**Recommendations**
- Reach out to potentially inactive customers through follow-up messages and targeted promotions to encourage repeat purchases.
- Offer relevant discounts or special deals to motivate customers to return.
- Monitor customer purchasing activity regularly to identify those who may be at risk of becoming inactive.
- Focus on retaining high value customers within this group to protect revenue.

### 2. Product Analytics
#### 2.1 Product Performance
- Product Revenue was measured by totalling each product's revenue from completed orders with discounts already deducted.
- The table below shows the top 5 products that generated most revenue.

| Rank | Product | Revenue (KSh) |
|---:|---|---:|
| 1 | iPhone 13 | 3,766,458.15 |
| 2 | HP 250 G9 Laptop | 2,510,510.15 |
| 3 | Hotpoint Refrigerator | 2,386,956.60 |
| 4 | Lenovo IdeaPad 3 | 2,032,875.00 |
| 5 | Samsung 55in Smart TV | 1,831,977.10 |

**Findings**
- The top five products generate approximately KSh 12.5 million accounting for nearly half of Duka's total sales. The iPhone 13 alone contributes 15.6%. This shows that Duka relies heavily on a few products and stock shortages or price changes could significantly affect sales
- High revenue does not necessarily mean high profit. For example the iPhone 13 had a 6.21% profit margin therefore, product performance decisions should consider cost and discounting as well as sales.

**Recommendations**
- Keep the top five reliably in stock and monitor their demand.
-  Check how much discount these products receive and whether it is needed to win the sale.
- Add product level profit and profit margin to this ranking for accuracy.

#### 2.2 Product Category Performance
- Profit refers to revenue generated after deducting all expenses while profit margin is the percentage of revenue a business keeps as profit after costs.

- The table below shows the performance of the product categories

| Product Category | Revenue (KSh) | Profit (KSh) | Profit Margin |
|---|---:|---:|---:|
| Accessories | 1,077,496.10 | 456,746.10 | 42.39% |
| Home Appliances | 4,024,234.05 | 458,034.05 | 11.38% |
| Computing | 6,596,221.70 | 700,021.70 | 10.61% |
| Mobile Phones | 6,942,060.65 | 728,760.65 | 10.50% |
| Electronics | 5,515,359.20 | 547,359.20 | 9.92% |

**Findings**
- Accessories has the highest profit margin but the lowest total profit showing strong profitability but low sales volume.
- Mobile Phones and Computing contribute the most to total profit. Together they generate about half of the business's total profit.
- Home Appliances has a relatively low profit margin suggesting high costs or heavy discounts on its products.

**Recommendation**
- Encourage customers buying phones and computers to purchase related accessories such as headphones and laptop bags inorder to increase sales and generate more profit without reducing product prices.
- Review supplier costs, discounts and delivery expenses in Home Appliances to improve profitability.

### 3. Monthly revenue and Margin
- August 2026 recorded the highest revenue at KSh 2,242,033.90. September revenue dropped by 6.67% to KSh 2,092,445.15 though its profit margin improved from 12.21% to 14.28%.
- January 2026 had the lowest revenue at KSh 322,432.95.
- Sales growth has been inconsistent this suggests fluctuations in customer demand and purchasing patterns.

**Recommendation**
- Plan stock levels and marketing campaigns ahead of peak sales periods to maximise revenue.
- Analyse the products and customer activities that contributed to high sales in August and other strong performing months.
- Introduce targeted promotions during low performing months such as January to encourage customer purchases.

### 4. Location Performance
- Nairobi generated the highest revenue at KSh 9.58 million while Mombasa ranked second at KSh 3.16 million. Together the two cities contributed 52.75% of total revenue.
- Machakos generated the least revenue of 745,099

**Recommendation**
- Maintain sufficient stock and good customer service in Nairobi and Mombasa to protect existing sales.
- Introduce targeted marketing campaigns in the poor performing cities to increase sales.

### 5. Orders Cancellation
 - There were 90 cancelled orders out of the 800 total orders.
 - The Cancellation rate was measured by comparing the number of cancelled orders against all recorded orders which resulted to a rate of 11.25%.
 - Possible causes may include stock availability, delivery arrangements or customers changing their minds last minute.

 **Recommendation**
 - Investigate the main reasons for cancellations particularly stock shortages, payment failures and delivery delays.
 - Follow up with customers whose orders are cancelled to understand their concerns and encourage them to reorder where possible.
 - Monitor cancellation rates regularly to measure improvements and identify recurring issues.

 ## Challenges and Limitations
 - Profit subtracts product cost only so the margins reported are gross margins. Rent, salaries, marketing and other operating costs are not included.
 - Inactivity is measured against the latest order date in the dataset not today's date therefore, it describes the period the data covers.
 - The analysis shows what happened and not why. The causes behind cancellations, inactivity and the Accessories margin may need further investigation.
 -  Customers without completed orders are excluded from the completed order customer segmentation and the inactivity query.
 
## Conclusion
Duka Smart order data shows that making the most sales is not the same as making the most money. The big categories bring in the revenue but keep little of it, the smallest category earns far more on each sale and some customers and orders are slipping away.
The business should protect margins where volume is highest, grow Accessories carefully, win back customers who have stopped buying, and find out why orders get cancelled. Follow up analysis is needed to explain why these patterns exist.


