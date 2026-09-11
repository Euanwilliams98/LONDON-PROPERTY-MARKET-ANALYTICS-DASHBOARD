# London Property Market Analytics Dashboard

[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)](#dashboard-preview)
[![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?logo=mysql&logoColor=white)](sql/analysis_queries.sql)
[![Data](https://img.shields.io/badge/records-73%2C534-1f6feb)](#dataset)
![Status](https://img.shields.io/badge/status-complete-2E8B57)

> An end-to-end recruiter-ready BI case study covering data quality, modelling, KPI reporting and stakeholder-focused recommendations.

A business intelligence project analysing residential property values, housing characteristics and long-term price movements across London. The project combines **SQL, Power Query, data modelling and DAX** to turn 73,534 records into an interactive Power BI report for market and investment analysis.

## Executive summary

The analysed market contains **22,258 properties** with an estimated total value of **£15.7bn**. The mean price is **£704k**, compared with a median of **£430k**, showing that a relatively small number of high-value homes pull the average upwards. Flats represent the largest segment and contribute approximately **£9.8bn** in market value, while detached homes have the highest average price at about **£947k**. New builds account for **11%** of properties.

### Business questions

- What is the size and value of the analysed London property market?
- How do prices differ by property type, bedroom count, tenure and area?
- How different are average and median prices, and what does that indicate?
- What share of the market is made up of new-build properties?
- How have recorded sale prices changed from 1995 to 2025?

## Dashboard preview

![London Property Market Analytics Dashboard](https://github.com/user-attachments/assets/581f8020-d70d-4fe6-8c9a-59ee875928ca)

## Key findings and recommendations

| Finding | Interpretation | Recommended use |
|---|---|---|
| Average price: **£704k**; median: **£430k** | The distribution is right-skewed, so the mean alone overstates the price of a typical property. | Report median alongside average and segment premium properties separately. |
| Flats contribute about **£9.8bn** | Flats drive the largest share of total market value through volume. | Prioritise flat-level analysis by area, tenure and bedroom count. |
| Detached homes average about **£947k** | Detached properties occupy the highest-value segment. | Treat them as a premium segment rather than comparing them directly with the whole market. |
| New builds represent **11%** (2,458 properties) | Existing homes dominate the analysed stock. | Compare the new-build price premium by area and property type before making development decisions. |
| Historical prices generally rise over 1995–2025 | Long-run growth is clear, but a single trend can hide local or property-type differences. | Add year-on-year growth and area-level comparisons to identify where growth is strongest or weakest. |

These findings describe the supplied datasets and should not be treated as a valuation model or a complete census of the London housing market.

## Dataset

| Dataset | Rows | Period | Purpose |
|---|---:|---|---|
| `properties_main_clean.csv` | 22,258 | Snapshot | Property characteristics and current values |
| `price_history_clean.csv` | 51,276 | 1995–2025 | Historical sale-price analysis |

The raw data is not included in this public repository. A field-level description and validation expectations are provided in [docs/data_dictionary.md](docs/data_dictionary.md).

## Analytical workflow

1. **Prepare** – standardise prices, categories, dates and text fields.
2. **Validate** – check nulls, invalid prices, duplicates and key integrity.
3. **Model** – relate property records to price history and create a calendar table.
4. **Analyse** – calculate KPIs and segment performance with SQL and DAX.
5. **Communicate** – build an interactive Power BI report and translate results into decisions.

## Repository structure

```text
.
├── README.md
├── docs/
│   ├── data_dictionary.md
│   └── methodology.md
├── power-bi/
│   └── measures.dax
└── sql/
    ├── analysis_queries.sql
    └── data_quality_checks.sql
```

## Technical highlights

- SQL profiling, validation, conditional aggregation and window functions
- Power Query transformations and a property-to-price-history data model
- DAX measures for total value, median price, new-build share and annual growth
- Executive KPI cards with drill-down by property type, bedrooms, tenure and area
- Explicit separation of descriptive findings, interpretation and recommendations

## Reproduce the analysis

1. Load the two cleaned CSV files into MySQL or Power BI.
2. Align imported field names with [docs/data_dictionary.md](docs/data_dictionary.md).
3. Run [sql/data_quality_checks.sql](sql/data_quality_checks.sql).
4. Run [sql/analysis_queries.sql](sql/analysis_queries.sql).
5. Create the Power BI measures in [power-bi/measures.dax](power-bi/measures.dax).
6. Compare the outputs with the headline KPIs above.

## Limitations

- The analysis is descriptive and does not control for inflation, property condition or floor area.
- Coverage depends on the source and completeness of the supplied records.
- Average prices should not be interpreted as like-for-like appreciation.

## Skills demonstrated

`Power BI` · `Power Query` · `DAX` · `SQL` · `MySQL` · `Excel` · `Data cleaning` · `Data modelling` · `Data quality` · `KPI reporting` · `Data storytelling`

## Author

**Euan Williams** — Junior Business Intelligence & Data Analyst  
[View my full portfolio](https://github.com/Euanwilliams98) · [Connect on LinkedIn](https://www.linkedin.com/in/euan-williams-081755232/)

