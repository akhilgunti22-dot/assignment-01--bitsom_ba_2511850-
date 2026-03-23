 	## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal contracts using natural language queries. Keyword search relies on exact word matching, which means it may miss relevant information if the wording in the query differs from the wording in the document. For example, a query like “termination clauses” might not return sections labeled as “contract cancellation” or “agreement ending,” even though they are semantically similar.

Legal documents are typically long, complex, and written using varied terminology. This makes semantic understanding crucial. A keyword-based system lacks the ability to interpret meaning, context, and intent behind the query, resulting in incomplete or inaccurate results.

A vector database addresses this limitation by enabling semantic search. In this system, contract text is broken into smaller chunks and converted into embeddings—numerical representations that capture the meaning of the text. When a lawyer submits a query in plain English, it is also converted into an embedding. The vector database then retrieves the most semantically similar chunks based on cosine similarity, rather than exact word matches.

This approach allows the system to understand context and retrieve relevant sections even when different terminology is used. As a result, lawyers can quickly find precise information within large contracts, improving efficiency, accuracy, and overall productivity.
