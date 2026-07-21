# 📊 Agriculture Packout & Yield Analytics Dashboard (Power BI)

## 📌 Project Overview
This project provides an end-to-end Power BI reporting solution designed to track, analyze, and optimize agricultural packing operations, product size distribution, and weekly yield trends. 

By centralizing yield data, size breakdowns, waste/dumpage rates, and week-over-week (WoW) performance, this dashboard enables operational teams to make data-driven harvest and distribution decisions.

---

## 🏗️ Data Architecture & Modeling
The solution relies on a robust **Star Schema** to ensure fast query performance and clean DAX calculations across multiple operational tables.

### Data Model Structure:
* **Dimension Tables (Lookups):**
  * `Calendar`: Custom DAX date dimension supporting week-based time intelligence (`WeekNumber`, `YearWeek`, continuous `WeekIndex`).
  * `PeperID`: Master dimension containing unique product IDs, colors, and commodity metadata.
* **Fact Tables (Data):**
  * `Yearly_Packout`: Grade/size volume distributions (Dump, S, M, L, XL, XXL, No2).
  * `Yearly_Harvest`: Total harvested kilograms.
  * `Yearly_Weights`: Pack weight metrics.
  * `Yearly_Proyection`: Harvest and packout projections.

---

## 💡 Key Features & DAX Implementations

### 1. Explicit Measure Branching
Base volume metrics were converted from implicit column sums into explicit DAX measures for modularity, reusability, and formatting control.
```dax
Grand Total Packout = 
[Total Dump CS] + [Total Dump kg] + [Total L] + [Total M] + 
[Total No2] + [Total S] + [Total sXL] + [Total XL] + [Total XXL]
