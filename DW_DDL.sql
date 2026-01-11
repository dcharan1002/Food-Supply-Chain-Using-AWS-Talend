-- Table: Dim_Farm
CREATE TABLE Dim_Farm (
    Farm_ID INT PRIMARY KEY,
    Farm_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    Owner VARCHAR(100),
    Contact VARCHAR(20)
);

-- Table: Dim_Date
CREATE TABLE Dim_Date (
    Date_ID INT PRIMARY KEY,
    Full_Date DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT
);

-- Table: Dim_Customer
CREATE TABLE Dim_Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Table: Dim_Retailer
CREATE TABLE Dim_Retailer (
    Retailer_ID INT PRIMARY KEY,
    Retailer_Name VARCHAR(100),
    Location VARCHAR(100),
    Contact VARCHAR(50)
);

-- Table: Dim_Product
CREATE TABLE Dim_Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Farm_ID INT,
    FOREIGN KEY (Farm_ID) REFERENCES Dim_Farm(Farm_ID)
);

-- Table: Dim_Payment
CREATE TABLE Dim_Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Type VARCHAR(50),       -- Cash / Card / Online
    Payment_Status VARCHAR(50),     -- Completed / Pending / Failed
    Payment_Date DATE
);

-- Table: Dim_Supplier
CREATE TABLE Dim_Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Contact VARCHAR(50),
    Location VARCHAR(100)
);

-- Table: Dim_Warehouse
CREATE TABLE Dim_Warehouse (
    Warehouse_ID INT PRIMARY KEY,
    Warehouse_Name VARCHAR(100),
    Location VARCHAR(100),
    Capacity INT
);

-- Table: Fact_Order
CREATE TABLE Fact_Order (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Retailer_ID INT,
    Product_ID INT,
    Payment_ID INT,
    Date_ID INT,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Total_Order DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID),
    FOREIGN KEY (Retailer_ID) REFERENCES Dim_Retailer(Retailer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Dim_Payment(Payment_ID),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID)
);

-- Table: Fact_Shipment
CREATE TABLE Fact_Shipment (
    Shipment_ID INT PRIMARY KEY,
    Product_ID INT,
    Supplier_ID INT,
    Warehouse_ID INT,
    Ship_Date DATE,
    Delivery_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Dim_Supplier(Supplier_ID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Dim_Warehouse(Warehouse_ID)
);

-- Table: Fact_QualityCheck
CREATE TABLE Fact_QualityCheck (
    Quality_ID INT PRIMARY KEY,
    Product_ID INT,
    Check_Date DATE,
    Location VARCHAR(100),
    Status VARCHAR(50),
    Remarks VARCHAR(255),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID)
);
