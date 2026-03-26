-- Loading Data --

CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(50)
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data.csv'
INTO TABLE online_retail
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  InvoiceNo,
  StockCode,
  Description,
  Quantity,
  @InvoiceDate,
  UnitPrice,
  @CustomerID,
  Country
)
SET
  InvoiceDate = STR_TO_DATE(@InvoiceDate, '%m/%d/%Y %H:%i'),
  CustomerID = NULLIF(@CustomerID, '');
  
-- Validation Checks --

SELECT * FROM online_retail;

SELECT 
  MIN(InvoiceDate), 
  MAX(InvoiceDate) 
FROM online_retail;

SELECT 
  COUNT(*) AS total_rows,
  SUM(CustomerID IS NULL) AS missing_customers
FROM online_retail;

-- Creating clean view --

CREATE VIEW clean_retail AS
SELECT *
FROM online_retail
WHERE Quantity > 0
  AND UnitPrice > 0
  AND InvoiceNo NOT LIKE 'C%';
  
-- Creating fields to analyze -- 

CREATE VIEW retail_features AS
SELECT
	*,
	Quantity * UnitPrice AS revenue,
	YEAR(InvoiceDate) AS year,
	MONTH(InvoiceDate) AS month
FROM clean_retail;

CREATE OR REPLACE VIEW  customer_metrics AS
SELECT
    CustomerID,
    Country,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    SUM(Quantity * UnitPrice) AS total_revenue,
    SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS avg_order_value,
    MAX(InvoiceDate) AS last_purchase_date
FROM clean_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country;

-- Analysis --

-- Monthly Revenue Trend --
SELECT
  year,
  month,
  SUM(revenue) AS monthly_revenue
FROM retail_features
GROUP BY year, month 
ORDER BY year, month;

-- Revenue By Country --
SELECT
  Country,
  SUM(revenue) AS total_revenue
FROM retail_features
GROUP BY Country
ORDER BY total_revenue DESC;

-- Avg revenue per order --
SELECT
  year,
  month,
  SUM(revenue) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM retail_features
GROUP BY year, month
ORDER BY year, month;

-- Top Customers --
SELECT * 
FROM customer_metrics
ORDER BY total_revenue DESC
LIMIT 20;

SELECT *
FROM customer_metrics
ORDER BY total_orders DESC
LIMIT 20;

SELECT *
FROM customer_metrics
ORDER BY avg_order_value DESC
LIMIT 20;

SELECT 
    Country,
    SUM(Quantity * UnitPrice) AS country_revenue,
    ROUND(
        SUM(Quantity * UnitPrice) /
        (SELECT SUM(Quantity * UnitPrice) FROM clean_retail) * 100,
        2
    ) AS revenue_percentage
FROM clean_retail
GROUP BY Country
ORDER BY country_revenue DESC;

SELECT COUNT(DISTINCT CustomerID) AS total_uk_customers
FROM clean_retail
WHERE Country = 'United Kingdom\r'
	AND CustomerID IS NOT NULL;
    
SELECT ROUND(COUNT(DISTINCT CustomerID) * 0.10) AS top_10_percent
FROM clean_retail
WHERE Country = 'United Kingdom\r'
  AND CustomerID IS NOT NULL;
  
SELECT
    ROUND(
        SUM(total_revenue) /
        (
            SELECT SUM(Quantity * UnitPrice)
            FROM clean_retail
            WHERE Country = 'United Kingdom\r'
        ) * 100,
        2
    ) AS top_10_percent_uk_revenue_share
FROM (
    SELECT
        CustomerID,
        SUM(Quantity * UnitPrice) AS total_revenue
    FROM clean_retail
    WHERE Country = 'United Kingdom\r'
      AND CustomerID IS NOT NULL
    GROUP BY CustomerID
    ORDER BY total_revenue DESC
    LIMIT 392
) AS top_uk_customers;

-- What drives sales --

SELECT 
	Distinct Description,
    UnitPrice
FROM clean_retail;

SELECT
  Description,
  SUM(revenue) AS product_revenue
FROM retail_features
GROUP BY Description
ORDER BY product_revenue DESC
LIMIT 10;

SELECT
  Description,
  SUM(Quantity) AS total_units_sold 
FROM retail_features
GROUP BY Description
ORDER BY total_units_sold DESC
LIMIT 10;

SELECT
    ROUND(
        SUM(product_revenue) /
        (SELECT SUM(Quantity * UnitPrice) FROM clean_retail) * 100,
        2
    ) AS top_10_product_revenue_percentage
FROM (
    SELECT
        Description,
        SUM(Quantity * UnitPrice) AS product_revenue
    FROM clean_retail
    GROUP BY Description
    ORDER BY product_revenue DESC
    LIMIT 402
) AS top_products;

SELECT
    Country,
    ROUND(
        SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS avg_order_value
FROM clean_retail
GROUP BY Country
ORDER BY avg_order_value DESC;

-- Potential Growth --
SELECT
    COUNT(DISTINCT CASE WHEN order_count = 1 THEN CustomerID END) AS one_time_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN CustomerID END) AS repeat_customers,
    COUNT(DISTINCT CustomerID) AS total_customers,
    ROUND(
        COUNT(DISTINCT CASE WHEN order_count > 1 THEN CustomerID END)
        / COUNT(DISTINCT CustomerID) * 100,
        2
    ) AS repeat_customer_percent
FROM (
    SELECT
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS order_count
    FROM clean_retail
    GROUP BY CustomerID
) t;

SELECT
    Country,
    SUM(Quantity * UnitPrice) AS total_revenue,
    COUNT(DISTINCT CustomerID) AS total_customers
FROM clean_retail
GROUP BY Country
ORDER BY total_revenue DESC;

SELECT
    Description,
    SUM(Quantity) AS total_units_sold
FROM clean_retail
GROUP BY Description
ORDER BY total_units_sold ASC;

SELECT COUNT(*) AS low_selling_products
FROM (
    SELECT
        Description,
        SUM(Quantity) AS total_units_sold
    FROM clean_retail
    GROUP BY Description
    HAVING SUM(Quantity) < 50
) t;

SELECT
    CASE
        WHEN total_revenue < 500 THEN 'Low Value'
        WHEN total_revenue BETWEEN 500 AND 2000 THEN 'Mid Value'
        ELSE 'High Value'
    END AS customer_segment,
    COUNT(*) AS customer_count
FROM (
    SELECT
        CustomerID,
        SUM(total_revenue) AS total_revenue
    FROM customer_metrics
    GROUP BY CustomerID
) t
GROUP BY customer_segment;

-- Risks --
SELECT
  SUM(total_revenue) AS top_10_revenue
FROM (
    SELECT total_revenue
    FROM customer_metrics
    ORDER BY total_revenue DESC
    LIMIT 10
) AS top_customers;

