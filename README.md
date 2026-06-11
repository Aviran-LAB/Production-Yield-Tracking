# Production Yield Tracking & Analytics Automation 📊

## 📝 Project Overview
This project is an end-to-end data pipeline and analytics solution designed to replace manual spreadsheet tracking on a production floor. By leveraging the Microsoft Power Platform, I created a real-time tracking application, structured the database architecture, and built an interactive dashboard to monitor quality yield, waste rates, and forecast accuracy.

**Tools Used:** Power Apps, SharePoint / SQL, Power BI, DAX

---

## 🏗️ Architecture & Workflow

### Phase 1: Data Collection (Power Apps)
* **Mobile-Friendly UI:** Developed a front-end application for production workers to input daily output data seamlessly.
* **Data Integrity Controls:** Implemented dropdown menus populated from a master dimensional table to prevent manual typos and ensure naming consistency.
* **Validation Rules:** Configured the application to make 'Weight' and 'Quality Grade' fields mandatory before submission to prevent null values downstream.

### Phase 2: Data Storage & Pipeline (SharePoint / SQL)
* **Centralized Storage:** Transitioned the business away from siloed Excel files by triggering automated saves to a structured centralized database.
* **Standardized Logging:** Built dedicated input fields to record product weights and distinct output quality grades (Premium, Secondary, Waste).

### Phase 3: Data Transformation & Modeling
* **Star Schema Design:** Established a One-to-Many relationship between the Product Reference table (Dimension) and Daily Production logs (Fact).
* **Primary Keys:** Assigned unique IDs to each product variant to enable a seamless filter context without duplicating records.
* **Time Intelligence:** Handled null values and generated a dedicated Calendar Table to enable accurate chronological sorting and time-series analysis.

---

## 📈 Analytics & Visualization (Power BI)

I developed several DAX measures to track Key Performance Indicators (KPIs). 

### Key DAX Measures Developed
To ensure accuracy and prevent division-by-zero errors, I utilized the `DIVIDE` function calculations.

```dax
// Example: Calculating Premium Grade Yield Percentage
Premium Yield % = 
DIVIDE(
    SUM('ProductionLogs'[Premium Boxes]), 
    SUM('ProductionLogs'[Total Output Volume])
)
