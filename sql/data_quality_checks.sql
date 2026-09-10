/* Data-quality checks for the London Property Market dashboard.
   Expected fields are documented in docs/data_dictionary.md. */

-- Row counts and primary-key coverage
SELECT COUNT(*) AS property_rows,
       COUNT(DISTINCT property_id) AS distinct_property_ids
FROM properties_main_clean;

SELECT COUNT(*) AS history_rows,
       COUNT(DISTINCT property_id) AS properties_with_history
FROM price_history_clean;

-- Missing values used by the report
SELECT
    SUM(property_id IS NULL) AS missing_property_id,
    SUM(area IS NULL OR TRIM(area) = '') AS missing_area,
    SUM(property_type IS NULL OR TRIM(property_type) = '') AS missing_property_type,
    SUM(current_price IS NULL) AS missing_current_price
FROM properties_main_clean;

-- Invalid numeric and categorical values
SELECT *
FROM properties_main_clean
WHERE current_price <= 0
   OR bedrooms < 0
   OR is_new_build NOT IN (0, 1);

SELECT *
FROM price_history_clean
WHERE sale_price <= 0
   OR sale_date > CURRENT_DATE;

-- Duplicate property records
SELECT property_id, COUNT(*) AS row_count
FROM properties_main_clean
GROUP BY property_id
HAVING COUNT(*) > 1;

-- Duplicate transactions
SELECT property_id, sale_date, sale_price, COUNT(*) AS row_count
FROM price_history_clean
GROUP BY property_id, sale_date, sale_price
HAVING COUNT(*) > 1;

-- Price-history records that cannot be linked to a property
SELECT COUNT(*) AS orphan_history_rows
FROM price_history_clean h
LEFT JOIN properties_main_clean p ON p.property_id = h.property_id
WHERE p.property_id IS NULL;

-- Category standardisation checks
SELECT DISTINCT TRIM(property_type) AS property_type
FROM properties_main_clean
ORDER BY property_type;

SELECT DISTINCT TRIM(tenure) AS tenure
FROM properties_main_clean
ORDER BY tenure;

