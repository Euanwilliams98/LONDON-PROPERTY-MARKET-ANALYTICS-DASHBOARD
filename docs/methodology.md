# Methodology

## Scope

The dashboard combines a 22,258-row property snapshot with 51,276 historical price records covering 1995–2025. It is designed for descriptive market analysis rather than individual property valuation.

## Preparation

1. Removed currency symbols and thousands separators from price fields.
2. Converted prices and bedroom counts to numeric types.
3. Standardised whitespace, capitalisation and category labels.
4. Parsed transaction dates and derived calendar attributes.
5. Checked missing values, duplicates, invalid prices and unmatched keys.

## Data model

The model uses a property dimension linked one-to-many to transaction history. A separate calendar table supports year, quarter and year-on-year analysis. Measures are used instead of calculated columns where calculations need to respond to report filters.

## KPI definitions

| KPI | Definition |
|---|---|
| Property count | Distinct properties in the current filter context |
| Total market value | Sum of current property values |
| Average price | Arithmetic mean of current values |
| Median price | Middle current value after sorting; less sensitive to extremes |
| New-build share | New-build properties divided by all properties |
| YoY price change | Percentage change in average sale price from the previous year |

## Interpretation safeguards

- Average and median are shown together because premium properties skew the distribution.
- Area rankings should use a minimum sample threshold.
- Historical changes describe recorded transactions; they are not a repeat-sales index.
- Nominal prices have not been adjusted for inflation.
- Results depend on the coverage and quality of the supplied datasets.

