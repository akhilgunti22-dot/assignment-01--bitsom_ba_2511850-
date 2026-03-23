## Storage Systems

In this architecture, different storage systems are selected based on the nature of the data and use case. For transactional hospital data such as patient records, diagnoses, and billing information, PostgreSQL is used as an OLTP database due to its reliability and strong consistency. For large-scale historical and semi-structured data such as treatment logs, doctor notes, and device data, a Data Lake (e.g., AWS S3 or Azure Data Lake) is used. This allows storage of structured, semi-structured, and unstructured data in formats like JSON, Parquet, and images.

For real-time ICU monitoring data, a streaming system like Apache Kafka is used along with a time-series database such as InfluxDB or TimescaleDB. This enables efficient ingestion and querying of high-frequency vitals data. For analytics and reporting, a Data Warehouse such as Snowflake or BigQuery is used, which stores cleaned and aggregated data optimized for fast queries.

Additionally, a vector database such as Pinecone or pgvector is used to store embeddings of patient history, enabling semantic search for doctor queries in natural language.

## OLTP vs OLAP Boundary

The OLTP system consists of operational databases such as PostgreSQL, which handle real-time transactions including patient admissions, treatments, and billing. These systems prioritize fast inserts and updates with strict consistency.

The OLAP system begins after data is extracted from OLTP systems through ETL/ELT pipelines. This data is transformed and loaded into the Data Lake and Data Warehouse. The Data Lake stores raw and semi-processed data, while the Data Warehouse stores structured, query-optimized data for reporting and analytics.

Thus, the boundary lies at the data pipeline stage, where transactional data is moved from operational systems into analytical systems for further processing and insights.

## Trade-offs

One major trade-off in this architecture is increased system complexity due to the use of multiple storage systems, including OLTP databases, Data Lakes, Data Warehouses, streaming systems, and vector databases. Managing and integrating these components can be challenging and may require skilled personnel and higher operational costs.

To mitigate this, the system can adopt a unified Data Lakehouse approach where possible, reducing the need for separate systems. Additionally, using managed cloud services such as AWS or Azure can simplify infrastructure management. Proper data governance, monitoring, and automation of pipelines can further reduce operational overhead and ensure system reliability.
