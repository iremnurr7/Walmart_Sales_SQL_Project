# Walmart Sales SQL Project

This project analyzes Walmart weekly sales data using SQL. The objective is to explore, clean, and analyze sales trends across stores, weeks, and years, including holiday effects and top-performing weeks. The project demonstrates SQL skills, analytical thinking, and the ability to interpret business data.

---

## Dataset
- **Source:** [Kaggle Walmart Sales Dataset](https://www.kaggle.com/datasets/mikhail1681/walmart-sales)
- **Columns:**
  - `Store` (int): Store number
  - `Date_` (date): Week ending date
  - `Weekly_Sales` (decimal): Sales for the week
  - `Holiday_Flag` (bit): 1 if week is holiday, 0 otherwise
  - `Temperature` (decimal): Average temperature for the store location
  - `Fuel_Price` (decimal): Weekly fuel price
  - `CPI` (decimal): Consumer Price Index
  - `Unemployment` (decimal): Unemployment rate

---

## Project Structure & SQL Scripts

### 01_Data_Overview.sql – Data inspection and cleaning
**Purpose:** Understand the dataset, check for missing or invalid values, and ensure correct data types.  
**Operations:**
- Display top 10 rows
- Count total rows
- Identify missing values in key columns (`Weekly_Sales`, `Date_`)
- Verify data types for numeric and date columns  

**SQL Concepts Used:** `SELECT`, `COUNT`, `SUM`, `CASE`  
**Insights:** The dataset contains no missing `Weekly_Sales` or `Date_` values. All stores have consistent weekly records.  
![Data Overview Screenshot]("screenshots/01.png")
---

### 02_Basic_Statistics.sql – Summary statistics and group analysis
**Purpose:** Compute basic statistics and examine sales by holiday vs. normal weeks.  
**Operations:**
- Minimum, maximum, average, and total weekly sales
- Total sales in 2010
- Compare average sales during holiday and non-holiday weeks

**SQL Concepts Used:** `MIN`, `MAX`, `AVG`, `SUM`, `GROUP BY`, `WHERE`  
**Insights:** Holiday weeks tend to have higher sales. 2010 total sales indicate early patterns of revenue growth.  
![Basic Stats Screenshot]("screenshots/02.png")

---

### 03_Time_Series_Analysis.sql – Trend and seasonality analysis
**Purpose:** Explore sales trends over time and calculate moving averages for smoothing.  
**Operations:**
- Monthly total sales aggregation
- 3-week and 4-week moving averages
- Year-over-Year (YoY) growth for annual performance comparison

**SQL Concepts Used:** `GROUP BY`, `ORDER BY`, `OVER`, `ROWS BETWEEN`, `LAG`  
**Insights:** Moving averages reveal sales trends, highlighting seasonal peaks and troughs. YoY growth shows overall yearly performance improvement.  
![Time Series Screenshot]("screenshots/03.png")

---

### 04_Top_Bottom_Performance.sql – Top and bottom performing weeks
**Purpose:** Identify highest and lowest sales weeks to understand performance extremes.  
**Operations:**
- Top 5 highest and lowest weekly sales
- Weeks with above-average sales

**SQL Concepts Used:** `TOP`, `ORDER BY`, subqueries  
**Insights:** Certain weeks (often around holidays) significantly outperform others, indicating seasonal demand impact.  
![Top Bottom Screenshot]("screenshots/04.png")

---

### 05_Advanced_Analytics.sql – Advanced SQL and insights
**Purpose:** Perform store-wise and advanced analyses to derive deeper insights.  
**Operations:**
- Store-wise cumulative sales
- Weekly change compared to previous week
- Sales categorization (`Low`, `Medium`, `High`)
- Top 3 sales weeks per store
- Holiday week effect on sales

**SQL Concepts Used:** Window functions (`SUM() OVER`, `LAG()`, `RANK()`), `CASE`, `PARTITION BY`  
**Insights:** Cumulative sales show growth trends per store. Weekly changes highlight volatility. Sales categories help identify performance levels quickly.  
![Advanced Analytics Screenshot]("screenshots/05.png")

---

## SQL Features Demonstrated
- Aggregation: `SUM`, `AVG`, `MIN`, `MAX`  
- Filtering and grouping: `WHERE`, `GROUP BY`, `TOP`  
- Window functions: `SUM() OVER`, `LAG()`, `RANK()`  
- Conditional logic: `CASE`  
- Time series analysis: monthly totals, moving averages, YoY growth  
- Data cleaning: handling NULLs, type conversion

---

## How to Run
1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/Walmart_Sales_SQL_Project.git

2. Open SQL Server Management Studio (SSMS)

3. Execute scripts sequentially:
01_Data_Overview.sql → 02_Basic_Statistics.sql → 03_Time_Series_Analysis.sql → 04_Top_Bottom_Performance.sql → 05_Advanced_Analytics.sql