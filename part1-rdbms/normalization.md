## Anomaly Analysis

### Insert Anomaly
A new product cannot be added independently because product details (product_id, product_name, category, unit_price) are stored only within order records. For example, there is no way to insert a new product without creating an order_id, which forces unnecessary order data entry. This results in an insert anomaly.

---

### Update Anomaly
Customer information is repeated across multiple rows. For example, the same customer_id appears in multiple rows (e.g., rows 1, 4, 5, and 6), along with repeated customer_name and customer_email values. If a customer's email needs to be updated, it must be changed in all these rows; otherwise, inconsistent data may occur. This creates an update anomaly.

---

### Delete Anomaly
The product with product_id = P008 appears only once (row 12). If this row (order_id = ORD1185) is deleted, all information about that product (product_name, category, unit_price) will also be lost. This results in a delete anomaly because deleting an order unintentionally removes important product data.
