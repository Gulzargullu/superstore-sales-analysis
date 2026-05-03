CREATE TABLE superstore_sales (
    row_id          INTEGER,
    order_id        VARCHAR(20),
    order_date      VARCHAR(20),
    ship_date       VARCHAR(20),
    ship_mode       VARCHAR(30),
    customer_id     VARCHAR(20),
    customer_name   VARCHAR(60),
    segment         VARCHAR(20),
    country         VARCHAR(50),
    city            VARCHAR(50),
    state           VARCHAR(50),
    postal_code     VARCHAR(10),
    region          VARCHAR(20),
    product_id      VARCHAR(20),
    category        VARCHAR(30),
    sub_category    VARCHAR(30),
    product_name    VARCHAR(150),
    sales           NUMERIC(10,2)
);

COPY superstore_sales
FROM 'D:/Project/SuperStore_clean.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';

SELECT COUNT(*) FROM superstore_sales;

-- Step 1: Add two new proper date columns
ALTER TABLE superstore_sales
ADD COLUMN order_date_clean DATE,
ADD COLUMN ship_date_clean DATE;

-- Step 2: Populate them by converting DD-MM-YYYY to DATE
UPDATE superstore_sales
SET order_date_clean = TO_DATE(order_date, 'DD-MM-YYYY'),
    ship_date_clean = TO_DATE(ship_date, 'DD-MM-YYYY');

-- Step 3: Verify
SELECT order_date, order_date_clean, ship_date, ship_date_clean
FROM superstore_sales
LIMIT 5;

SELECT 
    COUNT(*) as total_rows,
    MIN(order_date_clean) as earliest_order,
    MAX(order_date_clean) as latest_order
FROM superstore_sales;

SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(sales) / COUNT(order_id), 2) AS avg_order_value
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;


SELECT 
    product_name,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(order_id) AS times_ordered
FROM superstore_sales
GROUP BY product_name, category
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(sales) / COUNT(order_id), 2) AS avg_order_value,
    ROUND(SUM(sales) * 100.0 / (SELECT SUM(sales) FROM superstore_sales), 2) AS sales_percentage
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT 
    EXTRACT(YEAR FROM order_date_clean) AS year,
    EXTRACT(MONTH FROM order_date_clean) AS month,
    TO_CHAR(order_date_clean, 'YYYY-MM') AS year_month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    COUNT(order_id) AS total_orders
FROM superstore_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date_clean),
    EXTRACT(MONTH FROM order_date_clean),
    TO_CHAR(order_date_clean, 'YYYY-MM')
ORDER BY year, month;


SELECT 
    customer_name,
    customer_id,
    segment,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(order_id) AS total_orders
FROM superstore_sales
GROUP BY customer_name, customer_id, segment, region
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(sales) / COUNT(DISTINCT customer_id), 2) AS sales_per_customer
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;