// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    product_id: "E001",
    name: "Smartphone X",
    category: "Electronics",
    brand: "TechCorp",
    price: 29999,
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      battery: "5000mAh",
      processor: "Octa-core"
    },
    features: ["5G", "Dual SIM", "Fast Charging"],
    stock: 50
  },
  {
    product_id: "C001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    brand: "StyleWear",
    price: 1499,
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Blue", "Black", "White"],
    care_instructions: {
      wash: "Machine wash",
      iron: "Medium heat"
    },
    stock: 100
  },
  {
    product_id: "G001",
    name: "Organic Milk",
    category: "Groceries",
    brand: "FarmFresh",
    price: 60,
    expiry_date: new Date("2024-12-31"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "5g"
    },
    storage_instructions: "Keep refrigerated",
    stock: 200
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the "category" field improves query performance,
// especially for queries that frequently filter by category (e.g., Electronics or Groceries).
// It reduces the time required to scan the collection and speeds up data retrieval.
