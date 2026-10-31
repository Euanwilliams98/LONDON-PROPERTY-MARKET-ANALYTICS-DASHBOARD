# London Property Market Analytics Dashboard

I built this project to explore residential property values and historical sale prices across London. It brings together property details and transaction records, using SQL, Power Query, data modelling and DAX before presenting the results in Power BI.

The analysis covers 22,258 property records and 51,276 historical price records from 1995 to 2025.

## Dashboard preview

![London Property Market Analytics Dashboard](https://github.com/user-attachments/assets/581f8020-d70d-4fe6-8c9a-59ee875928ca)

## What I wanted to find out

- How large is the market represented by the dataset?
- How do prices vary by property type, bedroom count, tenure and area?
- How different are average and median prices?
- What proportion of the properties are new builds?
- How have recorded sale prices changed over time?

## Main findings

The property snapshot has an estimated total value of £15.7bn. The average property price is around £704,000, while the median is £430,000. The gap between the two suggests that higher-value properties are pulling the average upwards.

Other results from the analysis:

- Flats make up the largest share of the market by value, at approximately £9.8bn.
- Detached homes have the highest average price, at around £947,000.
- New builds account for 11% of the properties (2,458 records).
- Recorded sale prices generally increased over the 1995–2025 period.

## What the figures mean

The average and median tell different stories, so I would use the median alongside the average when describing a typical property price. Flats account for a large share of total value, while detached homes sit at the higher end of the price range.

The new-build share could be explored further by comparing prices across areas and property types. The historical data is useful for showing broad changes, but it should not be treated as a like-for-like house price index.

These results describe the records used in this project. They are not a property valuation model or a complete picture of every London home.

## Data used

| File | Records | Coverage |
|---|---:|---|
| \`properties_main_clean.csv\` | 22,258 | Property details and snapshot values |
| \`price_history_clean.csv\` | 51,276 | Historical transactions, 1995–2025 |

The source CSV files are not included in this public repository. The [data dictionary](docs/data_dictionary.md) describes the fields used in the analysis.

## How I worked through it

1. Prepared price, category and date fields.
2. Checked for missing values, duplicates, invalid prices and unmatched keys.
3. Connected property records to their transaction history and added a calendar table.
4. Used SQL and DAX to calculate the main measures and compare property groups.
5. Built the Power BI report with filters and drill-downs for property type, bedrooms, tenure and area.

## Files in this repository

- [Data dictionary](docs/data_dictionary.md)
- [Methodology](docs/methodology.md)
- [SQL analysis queries](sql/analysis_queries.sql)
- [SQL data quality checks](sql/data_quality_checks.sql)
- [Power BI measures](power-bi/measures.dax)

## Limitations

- The analysis is descriptive and does not account for inflation, property condition or floor area.
- Results depend on the coverage and quality of the source records.
- Changes in average sale price do not necessarily represent the change in value of the same property over time.

## Tools and skills

Power BI, Power Query, DAX, SQL, MySQL, Excel, data cleaning, data validation, data modelling and KPI reporting.

## Author

Euan Williams

[View my other projects](https://github.com/Euanwilliams98) · [LinkedIn](https://www.linkedin.com/in/euan-williams-081755232/)