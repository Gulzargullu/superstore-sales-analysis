# 🛒 Superstore Sales Analysis

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Python](https://img.shields.io/badge/Python-3.14-green)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)

## 📋 Project Overview
End-to-end sales data analysis of a US retail superstore covering 9,800 orders 
across 4 years (2015-2018). This project demonstrates the complete data analyst 
workflow — from database setup to interactive dashboard.

## 🛠️ Tools & Technologies
- **PostgreSQL** — Database design, data import, SQL querying
- **Python** — Data cleaning, EDA, visualization (Pandas, Matplotlib, Seaborn)
- **Power BI** — Interactive dashboard with KPIs, charts and slicers

## 📊 Dataset
- **Source:** Kaggle — Superstore Sales Dataset
- **Size:** 9,800 rows × 18 columns
- **Period:** January 2015 — December 2018
- **Fields:** Orders, customers, products, sales, regions, categories

## 🔍 Key Business Insights

### 1. 📈 Revenue Growing Year over Year
Sales grew from $484K (2015) to $733K (2018) — a **51% increase** over 4 years 
showing consistent business growth.

### 2. 🌍 West Region Leads in Revenue
West generated **$710K** across 3,140 orders — the highest of all regions. 
South has the highest avg order value ($243) but lowest volume.

### 3. 💻 Technology Drives Revenue
Technology accounts for **36.59%** of total sales with the highest avg order 
value of $456 — despite having the fewest orders (1,813).

### 4. 📦 Office Supplies Drives Volume
Office Supplies had **5,909 orders** — 3x more than Technology — but at only 
$119 avg order value showing high frequency low value buying behavior.

### 5. 📅 Q4 is Always Peak Season
September, November and December are consistently the strongest months every 
year. November 2018 hit **$117K** — the highest single month in the dataset.

### 6. 👥 Consumer Segment Dominates
Consumer segment generates **49% of total revenue** ($1.14M) driven purely 
by volume — 409 unique customers vs Corporate's 236.

## 🗄️ SQL Analysis
Key queries written to answer business questions:

| Query | Business Question |
|---|---|
| Sales by Region | Which region generates most revenue? |
| Top 10 Products | Best performing products by sales |
| Sales by Category | Which category leads in sales? |
| Monthly Trend | How does revenue change over time? |
| Top Customers | Who are the highest value customers? |
| Customer Segments | Which segment is most valuable? |

## 🐍 Python Analysis
Performed using Pandas, Matplotlib and Seaborn:
- Data cleaning and missing value treatment
- Exploratory Data Analysis (EDA)
- Sales trend visualization
- Category and segment breakdown charts
- Top products horizontal bar chart

## 📈 Power BI Dashboard
Interactive dashboard featuring:
- **KPI Cards** — Total Sales, Total Orders, Top Region
- **Line Chart** — Sales trend 2015-2018
- **Donut Chart** — Sales by category
- **Bar Charts** — Sales by region and segment
- **Region Slicer** — Interactive filter

## 📁 Project Structure


## 🚀 How to Run
1. Import CSV to PostgreSQL using provided schema
2. Run SQL queries from `sales_queries.sql`
3. Open Jupyter notebook for Python analysis
4. Open `.pbix` file in Power BI Desktop

## 👤 Author
Gulzar  
Data Analyst  
[LinkedIn : https://www.linkedin.com/in/gulzar-bg] 
