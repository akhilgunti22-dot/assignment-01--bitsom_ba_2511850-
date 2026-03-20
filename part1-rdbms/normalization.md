## Anomaly Analysis

### Insert Anomaly
A new product cannot be added independently because product details (product_id, product_name, category, unit_price) are stored only within order records. For example, there is no way to insert a new product without creating an order_id, which forces unnecessary order data entry. This results in an insert anomaly.

---

### Update Anomaly
Customer information is repeated across multiple rows. For example, the same customer_id appears in multiple rows (e.g., rows 1, 4, 5, and 6), along with repeated customer_name and customer_email values. If a customer's email needs to be updated, it must be changed in all these rows; otherwise, inconsistent data may occur. This creates an update anomaly.

---

### Delete Anomaly
The product with product_id = P008 appears only once (row 12). If this row (order_id = ORD1185) is deleted, all information about that product (product_name, category, unit_price) will also be lost. This results in a delete anomaly because deleting an order unintentionally removes important product data.


## Normalization Justification

The argument that keeping all data in a single table is simpler may appear valid initially, but it leads to significant data management issues. In the given dataset, customer, product, and order details are stored together, resulting in repeated information across multiple rows. For example, a single customer's details appear multiple times whenever they place multiple orders. This redundancy increases storage usage and creates update anomalies, where modifying a customer’s information requires changes in multiple rows, increasing the risk of inconsistencies.

Similarly, product details such as product name and price are duplicated across orders. If a product price changes, failing to update all rows leads to inconsistent data. This demonstrates a clear update anomaly. Additionally, deleting a row representing an order could remove all information about a product or customer if it exists only in that row, resulting in a delete anomaly.

Normalization addresses these issues by organizing data into separate related tables, such as Customers, Products, Orders, and Order_Items. This structure ensures that each piece of information is stored only once, improving data integrity and consistency. It also allows independent insertion, updating, and deletion of records without unintended side effects.

Therefore, normalization is not over-engineering but a necessary step to ensure efficient, scalable, and reliable database design.
