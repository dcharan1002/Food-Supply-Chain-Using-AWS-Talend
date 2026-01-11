# -Food-Supply-Chain-Traceability-System
This project designs a relational database to enable end-to-end food supply chain traceability, linking farms, suppliers, warehouses, shipments, and retailers. It improves transparency, supports faster recalls, enhances quality control, and helps companies meet food safety and regulatory compliance requirements.

# Problem Statement: 
Food companies face major challenges in tracing products throughout the supply chain, from farms to retailers. Without a centralized system, it becomes difficult to ensure product quality, prevent contamination risks, manage delays, or comply with regulations. A relational database enables full traceability by linking farms, suppliers, warehouses, shipments, retailers, and customers. This ensures faster recalls, improved transparency, and enhanced quality control.

# Project Objective: 
The objective of this project is to design and implement a relational database system that provides end-to-end traceability of food products. The system will capture data from farms, suppliers, warehouses, shipments, and retailers to ensure transparency and accountability across the entire supply chain. It will also help companies comply with safety regulations, manage recalls efficiently, and provide better customer trust. 

# Scope of the Project: 
• Manage farms, suppliers, warehouses, retailers, and customers in one integrated database.
• Track products from their origin at farms to final delivery to customers. 
• Record quality checks and maintain compliance records at every stage. 
• Monitor shipments and orders with detailed tracking of timelines and statuses. 
• Provide secure, reliable payment processing and order management.
• Support efficient recall management in case of contamination or defective products. 

# Relational Database Design: 
The system will include 11 entities with defined primary and foreign keys to establish relationships:
1. Farms: farm_id, name, location, owner, contact
2. Products: product_id, name, category, farm_id
3. Suppliers: supplier_id, name, contact, location
4. Warehouses: warehouse_id, name, location, capacity
5. Shipments: shipment_id, product_id, supplier_id, warehouse_id, ship_date, delivery_date, status
6. Retailers: retailer_id, name, location, contact
7. Customers: customer_id, name, phone, email, address
8. Orders: order_id, customer_id, retailer_id, order_date, status
9. OrderDetails: order_detail_id, order_id, product_id, quantity, price
10. QualityChecks: quality_id, product_id, check_date, location, status, remarks
11. Payments: payment_id, order_id, amount, payment_date, method, status

# Expected Outcome: 
• Complete end-to-end traceability of food products. 
• Faster and more efficient recall management in case of contamination.
• Improved accountability across farms, suppliers, and retailers. 
• Enhanced quality control through integrated quality checks. 
• Reliable order and payment tracking to build customer trust. 

# Technology Used:
SQL,
Postgres,
Talend,
Dbeaver,
PowerBI
