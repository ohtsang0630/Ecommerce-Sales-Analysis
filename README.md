# Ecommerce-Sales-Analysis
This is a SQL based analysis on an e-commerce sale data set.

# Overview
The dataset used for this project was provided by Kaggle. It contains a transnational data set of transactions between 01/12/2010 and 09/12/2011 for a UK based online retailer. The data was cleaned in MySql and visualized with Tableau. The objective of this project was to identify key drivers of revenue, high value customers, retention risks, and opportunities for business growth.

# Tools Used \n
Excel - Initial data validation\n
MySql - Data loading, cleaning, transforming data, analysis\n
Tableau - Visualization of data

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
- Average order value over time

Findings:

