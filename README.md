# Ecommerce-Sales-Analysis
This is a SQL based analysis on an e-commerce sale data set.

# Overview
The dataset used for this project was provided by Kaggle. It contains a transnational data set of transactions between 01/12/2010 and 09/12/2011 for a UK based online retailer. The data was cleaned in MySql and visualized with Tableau. The objective of this project was to identify key drivers of revenue, high value customers, retention risks, and opportunities for business growth.

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

  
  The months that had the most earnings were Q4 months (September, October, November) which shows a stronger performance leading into the holidays. Surprisingly December had one of the lower revenues which suggests that customers like to buy before the holidays hit in order to anticipate for shipping delays. The countries that bought the most from this company was the United Kingdom which would be expected as this company is located there. Countries trailing the United Kingdom in revenue would be surrounding countries with some examples including the Netherlands, Eire, Germany, and France. One thing to note is that the revenue heavily comes from the United Kingdom as it exceeds other contries revenue by about $9 million. The average revenue per order for all months is around the same as they all average around $400 to $500 with the only outlier being December in which the average was $780 which could indicate customers making larger purchases in anticipation for the holidays. 

