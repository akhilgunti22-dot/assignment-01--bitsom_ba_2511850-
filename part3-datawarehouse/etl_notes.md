## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats (e.g., DD-MM-YYYY, MM/DD/YYYY, and text-based dates). This made it difficult to group and analyze data by time periods such as months or years.
Resolution: All dates were converted into a standardized ISO format (YYYY-MM-DD). Additionally, a separate date dimension (dim_date) was created to store structured attributes like day, month, and year, enabling consistent time-based analysis.

### Decision 2 — Handling Missing (NULL) Values
Problem: Some records in the dataset contained NULL or missing values for important fields such as product category and transaction amount. These incomplete records could lead to incorrect aggregations and unreliable insights.
Resolution: Records with critical missing values were either cleaned by imputing reasonable defaults (where possible) or removed if the data was insufficient. This ensured that only complete and reliable data was loaded into the fact table.

### Decision 3 — Standardizing Category Values
Problem: Product categories in the raw data had inconsistent casing and formatting (e.g., "electronics", "Electronics", "ELECTRONICS"). This would result in incorrect grouping and duplicate categories during analysis.
Resolution: All category values were standardized to a consistent format (proper case, e.g., "Electronics", "Clothing", "Groceries") before loading into the dim_product table. This ensured accurate aggregation and reporting by category.
