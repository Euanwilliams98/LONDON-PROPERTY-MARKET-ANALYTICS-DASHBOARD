/* Portfolio SQL examples for the London Property Market dashboard (MySQL 8+). */

-- 1. Executive KPIs
SELECT
    COUNT(DISTINCT property_id) AS properties,
    ROUND(SUM(current_price), 0) AS total_market_value,
    ROUND(AVG(current_price), 0) AS average_price
FROM properties_main_clean;

-- Median price pattern compatible with MySQL 8+
WITH ranked AS (
    SELECT current_price,
           ROW_NUMBER() OVER (ORDER BY current_price) AS row_num,
           COUNT(*) OVER () AS row_count
    FROM properties_main_clean
    WHERE current_price IS NOT NULL
)
SELECT AVG(current_price) AS median_price
FROM ranked
WHERE row_num IN (FLOOR((row_count + 1) / 2), FLOOR((row_count + 2) / 2));

-- 2. Property-type performance
SELECT
    property_type,
    COUNT(*) AS property_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS property_share_pct,
    ROUND(AVG(current_price), 0) AS average_price,
    ROUND(SUM(current_price), 0) AS total_market_value
FROM properties_main_clean
GROUP BY property_type
ORDER BY total_market_value DESC;

-- 3. New-build composition and price comparison
SELECT
    CASE WHEN is_new_build = 1 THEN 'New build' ELSE 'Existing' END AS build_status,
    COUNT(*) AS property_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS property_share_pct,
    ROUND(AVG(current_price), 0) AS average_price
FROM properties_main_clean
GROUP BY is_new_build
ORDER BY property_count DESC;

-- 4. Areas with enough observations for a stable comparison
SELECT
    area,
    COUNT(*) AS property_count,
    ROUND(AVG(current_price), 0) AS average_price,
    ROUND(SUM(current_price), 0) AS total_market_value
FROM properties_main_clean
GROUP BY area
HAVING COUNT(*) >= 30
ORDER BY average_price DESC
LIMIT 10;

-- 5. Annual price trend and year-on-year change
WITH annual_prices AS (
    SELECT YEAR(sale_date) AS sale_year,
           COUNT(*) AS transactions,
           AVG(sale_price) AS average_sale_price
    FROM price_history_clean
    WHERE sale_date IS NOT NULL AND sale_price > 0
    GROUP BY YEAR(sale_date)
), compared AS (
    SELECT *,
           LAG(average_sale_price) OVER (ORDER BY sale_year) AS prior_year_price
    FROM annual_prices
)
SELECT
    sale_year,
    transactions,
    ROUND(average_sale_price, 0) AS average_sale_price,
    ROUND(100.0 * (average_sale_price - prior_year_price) / prior_year_price, 1)
        AS yoy_change_pct
FROM compared
ORDER BY sale_year;

-- 6. Latest recorded sale for each property
WITH ranked_sales AS (
    SELECT property_id, sale_date, sale_price,
           ROW_NUMBER() OVER (
               PARTITION BY property_id ORDER BY sale_date DESC
           ) AS recency_rank
    FROM price_history_clean
)
SELECT property_id, sale_date, sale_price
FROM ranked_sales
WHERE recency_rank = 1;

