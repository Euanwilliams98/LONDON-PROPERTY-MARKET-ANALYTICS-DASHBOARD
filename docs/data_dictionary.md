# Data dictionary

The public repository does not contain the source CSV files. This dictionary documents the analysis-ready fields referenced by the SQL and DAX examples. Update the names if the original model uses different labels.

## Properties

| Field | Type | Description | Validation |
|---|---|---|---|
| `property_id` | Text/integer | Unique property identifier | Required and unique |
| `area` | Text | London area or locality | Required; trimmed and standardised |
| `property_type` | Text | Flat, terraced, semi-detached, detached or other type | Controlled categories |
| `bedrooms` | Integer | Number of bedrooms | Zero or greater |
| `tenure` | Text | Ownership/tenure category | Controlled categories |
| `is_new_build` | Boolean | Whether the property is a new build | 0/1 only |
| `current_price` | Decimal | Property value used in snapshot analysis (£) | Positive; no currency symbols |

## Price history

| Field | Type | Description | Validation |
|---|---|---|---|
| `property_id` | Text/integer | Link to the property table | Must match `Properties[property_id]` |
| `sale_date` | Date | Recorded transaction date | Valid date, not in the future |
| `sale_price` | Decimal | Recorded transaction value (£) | Positive; no currency symbols |

## Model relationships

- `Properties[property_id]` (one) → `PriceHistory[property_id]` (many)
- `Calendar[Date]` (one) → `PriceHistory[sale_date]` (many)

