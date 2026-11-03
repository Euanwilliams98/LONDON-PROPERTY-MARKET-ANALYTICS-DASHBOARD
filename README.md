# London Property Market Dashboard | Power BI and SQL

I built this project to explore property values and historical sale prices across London. I used SQL, Power Query and DAX to prepare and analyse the data, then presented the results in a Power BI dashboard.

The project uses 22,258 property records and 51,276 historical price records covering 1995 to 2025.

## Dashboard

![London Property Market Analytics Dashboard](https://github.com/user-attachments/assets/581f8020-d70d-4fe6-8c9a-59ee875928ca)

## Questions I explored

- What does the property data show about prices across London?
- How do prices compare by property type, bedroom count, tenure and area?
- How different are average and median prices?
- What share of the properties are new builds?
- How have recorded sale prices changed over time?

## Main results

The property snapshot has an estimated total value of £15.7bn. The average property price is around £704,000, while the median is £430,000. This difference suggests that higher-priced properties are pulling the average up.

Other results included:

- Flats make up the largest share of the market by value, at approximately £9.8bn.
- Detached homes have the highest average price, at around £947,000.
- New builds account for 11% of the properties (2,458 records).
- Recorded sale prices generally increased between 1995 and 2025.

## How I worked on the project

1. Prepared the price, category and date fields.
2. Checked for missing values, duplicates, invalid prices and unmatched keys.
3. Connected the property records to their transaction history and added a calendar table.
4. Used SQL and DAX to calculate the main figures and compare property groups.
5. Built the Power BI report with filters for property type, bedrooms, tenure and area.

## Data used

| File | Records | Coverage |
|---|---:|---|
| `properties_main_clean.csv` | 22,258 | Property details and snapshot values |
| `price_history_clean.csv` | 51,276 | Historical transactions, 1995–2025 |

The source CSV files are not included in this public repository. The [data dictionary](docs/data_dictionary.md) explains the fields used in the project.

## Project files

- [Data dictionary](docs/data_dictionary.md)
- [Methodology](docs/methodology.md)
- [SQL analysis queries](sql/analysis_queries.sql)
- [SQL data quality checks](sql/data_quality_checks.sql)
- [Power BI measures](power-bi/measures.dax)

## What I learned

I gained experience working with two related datasets and building a report from them. I also practised checking data quality, creating table relationships and using measures to compare property types and prices.

## Tools used

Power BI, Power Query, DAX, SQL, MySQL and Excel.

## Author

Euan Williams

[View my other projects](https://github.com/Euanwilliams98) · [LinkedIn](https://www.linkedin.com/in/euan-williams-081755232/)