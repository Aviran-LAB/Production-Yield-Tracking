-- DATABASE SCHEMA: Production Yield Tracking
-- ARCHITECTURE: Star Schema (1 Dimension Table, 1 Fact Table)

-- 1. Create the Dimension Table (Product Reference)
-- Master table for Power Apps dropdowns and filtering
CREATE TABLE Product_List (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Color VARCHAR(50) NOT NULL,
    Commodity VARCHAR(50) NOT NULL
);

-- 2. Create the Fact Table (Daily Production Logs)
-- Transactional data submitted via Power Apps / Forms
CREATE TABLE packout (
    PackoutID INT AUTO_INCREMENT PRIMARY KEY, -- Added a unique primary key for transactional integrity
    ProductID INT NOT NULL,                  -- Foreign Key referencing Product_List
    PackDate DATE NOT NULL,
    
    -- Packout Sizes / Yield Volumes
    XXL INT DEFAULT 0,
    XL INT DEFAULT 0,
    SXL INT DEFAULT 0,
    L INT DEFAULT 0,
    M INT DEFAULT 0,
    S INT DEFAULT 0,
    NO2 INT DEFAULT 0,
    Dump INT DEFAULT 0,
    
    -- Establish the One-to-Many Relationship
    CONSTRAINT FK_Packout_Product 
        FOREIGN KEY (ProductID) REFERENCES Product_List(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
