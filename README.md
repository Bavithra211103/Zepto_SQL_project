# 🛒 Zepto E-commerce Analysis: Inventory & Revenue Optimization

## 📌 Project Overview
This project involves a comprehensive analysis of a **Zepto** product dataset using **PostgreSQL**. The goal was to transform raw product data into actionable business insights, focusing on revenue drivers, inventory management, and pricing strategies.

---

## 🛠️ Tech Stack & Skills
* **Database:** PostgreSQL
* **Language:** SQL
* **Skills:** Data Cleaning (DML), Exploratory Data Analysis (EDA), Logic Segmentation, Revenue Modeling.

---

## 🧹 Data Cleaning & Transformation
Before performing analysis, I ensured the data was accurate and reliable:
* **Currency Normalization:** Converted prices from **Paise to Rupees** by dividing values by 100 for `mrp` and `discountedSellingPrice`.
* **Integrity Checks:** Identified and removed records where `mrp` was equal to 0 to prevent skewed analysis.
* **Validation:** Verified data for `NULL` values across all critical columns like `name`, `category`, and `quantity`.

---

## 📊 Key Business Insights
* **Revenue Mapping:** Calculated total estimated revenue per category by multiplying `discountedSellingPrice` with `availableQuantity`.
* **Out-of-Stock (OOS) Analysis:** Filtered high-value products (MRP > 300) that are currently out of stock to highlight potential revenue loss.
* **Pricing & Discounts:** Audited the top 10 best-value products based on their `discountPercent`.
* **Logistics Segmentation:** Used `CASE` statements to group inventory into **Low, Medium, and Bulk** weight categories based on `weightsInGms`.
* **Inventory Weight:** Calculated the total inventory weight per category to assist in warehouse space planning.

---

## 📂 Project Structure
* `zepto_project.sql`: Full SQL script containing table creation (DDL) and analysis queries.

---

## 🚀 How to Run
1. Create the `zepto` table using the provided schema.
2. Import the dataset into your PostgreSQL environment.
3. Run the queries in `zepto_project.sql` to generate insights.
