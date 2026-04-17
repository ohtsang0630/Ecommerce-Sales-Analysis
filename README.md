# Ecommerce-Sales-Analysis
This is a SQL based analysis on an e-commerce sale data set.

# Overview
The dataset used for this project was provided by Kaggle. It contains a transnational data set of transactions between 01/12/2010 and 09/12/2011 for a UK based online retailer. The data was cleaned in MySql and visualized with Tableau. The objective of this project was to identify key drivers of revenue, high value customers, retention risks, and opportunities for business growth.

# Interactive Dashboards
https://public.tableau.com/shared/J96839BNT?:display_count=n&:origin=viz_share_link

# Tools Used
- Excel - Initial data validation
- MySql - Data loading, cleaning, transforming data, analysis
- Tableau - Visualization of data  

# Data Preparation
**Data Loading**
- Loaded raw csv file into MySql
- Preserved raw dataset

**Cleaning**
- Removed cancelled orders
- Removed negative or zero quantity transactions
- Removed zero/negative price entries

**Transformation of Data**
- Revenue = Quantity × UnitPrice
- Extracted year and month
- Created customer-level metrics view

# Overall analysis
**Q1: How is revenue performing**  
Analysis Conducted: 
- Monthly revenue trend
- Revenue by country
- Average revenue per order

Findings:  
  
The months that had the most earnings were September, October, November which shows a stronger performance leading into the holidays. Surprisingly December had one of the lower revenues which suggests that customers like to buy before the holidays hit in order to anticipate for shipping delays. The other months not listed all had similar revenues, being around $700K showing a steady rate of products being pushed out year round. A small exception to this would be Februrary and April where the revenue was slightly lower sitting at $520k and $530k respectively. The countries that bought the most from this company was the United Kingdom showing a large domestic market. Countries trailing the United Kingdom in revenue would be surrounding countries with them being the Netherlands, Eire, Germany, and France. One thing to note is that the revenue heavily comes from the United Kingdom as it exceeds other contries revenue by about $9 million. International markets including the United States, Canada, Asia, and the Middle East are potential targets for expansion as they don't contribute much to the incoming revenue so future improvements could be look at in those areas. The average revenue per order for all months is around the same as they all average around $400 to $500 which shows consistent purchasing behavior year round. The only outlier of these stats would be December where the average was $780 indicating customers making larger purchases in anticipation for the holidays.  

**Q2: Best Customers**  
Analysis Conducted:  
- Top customers
- Top revenue by country
- Percentage of total revenue by country

Findings:  

When looking at who generates the most revenue we can see a heavy concentration within the United Kingdom as they account for 84.61% of the total company revenue. This relates to the early known fact that this company heavily relies on the domestic market. When looking internationally we actually see that the Netherlands generated the most revenue, even beating out the United Kingdom, sitting at $280k in revenue with the closest United Kingdom customer sitting at $259k. However the United Kingdom does lead in most orders placed with the highest being 209 orders and highest average order value with that being at $84236.25. This shows that domestic customers purchase more frequently and spend more per transaction. Looking deeper shows us that the top 10% of customers make up 48.28% of total revenue. This shows that nearly half of the companies total revenue is driven by a relatively small group of domestic customers which could be a potential risk factor.  

**Q3: What Drives Sales**  
Analysis Conducted:
- Products that generate the most revenue
- Most sold products
- Percentage of revenue produced by top products
- Average order value by country?

Findings:  

As stated before the country that generates the most revenue for this company is predominantly the United Kingdom who takes up 84.61% of total revenue. Trailing this would be international markets that are bordering or very close to the United Kingdom such as the Netherlands, Germany, France, and Eire to name a few. Once again this shows that this companies performance is heavily reliant on the domestic market. The top 3 products that generated the most revenue are as follows: Dotcom Postage, Regency Cakestand 3 Tier, Papercraft Little Birdie. These products generate around $160k-$200k in revenue. Delving deeper shows us that the top 10% of all products sold within this company make up 62.79% of total company revenue. This shows that a minority of products significantly influence a huge portion of total performance. Additionally the average order value seems to be relatively stable as mentioned before sitting at around $400-$500 which would suggest that revenue spikes are caused more by a higher increase in order volume as opposed to higher prices.

**Q4: Opportunities For Growth**  
Analysis Conducted:
- Type of customers(one time, repeating, etc)
- Total revenue/customers by country
- Low performing products
- Customer value distribution
- Potential risks

Findings:  

When considering the overall information collected we find that this company has a relatively strong customer retention rate. This rate sits at 65.58% of repeat customers (2,845 of 4,338 total), however 1,493 one-time buyers that show a clear opportunity for an increase in revenue. As stated before we know that the United Kingdom is where a majority of the revenue comes from sitting at around $9 million dollars across 3,920 customers. This means that international markets such as Germany, France, and the Netherlands contribute significantly less revenue. This shows a huge potential in geographical expansion. When looking at this companies customer value distribution, which shows how many low, mid, and high end customers there are, we can pinpoint exactly what type of customers they need to cater towards to increase revenue. We will specifically look at low end customers meaning these customers have a total revenue of less than $500. This number turns out to be 1761 customers which is about 68% of total customers. This is a huge pool of customers to work with in order to increase revenue which could be done by focusing on increasing their purchase frequency or average order value.
