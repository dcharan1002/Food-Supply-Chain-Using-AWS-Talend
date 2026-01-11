-- 1. farm
CREATE TABLE Farms (
    farm_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    owner VARCHAR(100),
    contact VARCHAR(20)
);
-- 2. products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    category VARCHAR(50),
    farm_id INT,
    FOREIGN KEY (farm_id) REFERENCES Farms(farm_id)
);

-- 3. suppliers
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(20),
    location VARCHAR(255)
);

-- 4. warehouses
CREATE TABLE Warehouses (
    warehouse_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    capacity DECIMAL(10,2)
);

-- 5. Shipments
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    warehouse_id INT,
    ship_date DATE,
    delivery_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

-- 6. Retailers
CREATE TABLE Retailers (
    retailer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    contact VARCHAR(20)
);
-- 7. Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- 8. Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    retailer_id INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (retailer_id) REFERENCES Retailers(retailer_id)
);

-- 9. Orderdetails 
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- 10. Qualitychecks
CREATE TABLE QualityChecks (
    quality_id INT PRIMARY KEY,
    farm_id INT,
    product_id INT,
    check_date DATE,
    location VARCHAR(255),
    status VARCHAR(50),
    remarks VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (farm_id) REFERENCES Farms(farm_id)
);

-- 11. payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    status VARCHAR(50),
    payment_type VARCHAR(10) NOT NULL, -- will be 'Card', 'Cash', or 'Online'
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
