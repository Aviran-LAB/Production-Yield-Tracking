-- =========================================================================
-- DATABASE SCHEMA: Production Yield Tracking
-- ARCHITECTURE: Star Schema (1 Dimension Table, 1 Fact Table)
-- =========================================================================

-- 1. Create the Dimension Table (Product Reference)
-- This table acts as our "Master List" for dropdowns in Power Apps.
CREATE TABLE Product_List (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Color VARCHAR(100) NOT NULL,
    Category VARCHAR(50)
);

-- 2. Create the Fact Table (Daily Production Logs)
-- This table stores the transactional data submitted via the Power App.
CREATE TABLE packout (
ID INT,
color VARCHAR(50),
commodity VARCHAR(50),
   -- Metadata
pack_date DATE,
xxl INT,
xl INT,
sxl INT,
l INT,
m INT,
s INT,
NO2 INT,
dump INT,
  -- Establish the One-to-Many Relationship (Foreign Key)
FOREIGN KEY(ID) REFERENCES peper_list(peper_ID)
);
    
   
  -- 3. Example: Creating a View for Power BI
-- This view pre-calculates the waste rate before it hits the Power BI model.
CREATE VIEW vw_DailyYieldSummary AS
SELECT 
    f.pack_date,
    p.Color,
    p.Category,
    f.dump, -- the garbage/waste amount
    -- Add up all boxes for the denominator
    (f.xxl + f.xl + f.sxl + f.l + f.m + f.s + f.NO2 + f.dump) AS Total_Boxes,
    -- Calculate the Dump Rate Percentage
    (f.dump / (f.xxl + f.xl + f.sxl + f.l + f.m + f.s + f.NO2 + f.dump)) * 100 AS Dump_Rate_Percentage
FROM 
    packout f
JOIN 
    Product_List p ON f.ID = p.ProductID;
