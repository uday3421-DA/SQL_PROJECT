
🧼 Layoff Data Cleaning for EDA (SQL Project) 



📌 Overview
This project focuses on cleaning a messy global layoff dataset from Kaggle to prepare it for Exploratory Data Analysis (EDA).
The goal was to fix duplicates, standardize data formats, handle missing values, and tidy up the structure — so the data is ready for real analysis.

📁 About This Project

It helped me sharpen my hands-on skills with data preparation and gave me confidence working with messy, unstructured data.


🗂️ Dataset

Source: https://www.kaggle.com/datasets/swaptr/layoffs-2022

Type: Global layoffs, 2020–2022
Includes: Company name, location, industry, total laid off, percentage laid off, funding raised, stage, and date


🔧 What I Did

✅ Created a safe staging table to protect the original dataset

✅ Removed duplicates using ROW_NUMBER() and CTEs

✅ Standardized text fields (company, industry, location)

✅ Converted date column from text to SQL DATE format

✅ Handled missing values by converting blanks to NULL and filling missing values using self joins

✅ Dropped unreliable rows/columns to clean the dataset thoroughly


🧠 Tools & Skills Used

SQL (MySQL) for data cleaning and manipulation

Techniques:
Window Functions (ROW_NUMBER())
CTEs (Common Table Expressions)
Text trimming & standardization
Date conversion
NULL handling and logic



💡 What I Learned

How to clean messy real-world data in SQL
How to write clear, well-commented SQL scripts step by step
How to prepare datasets for actual EDA work — not just theory

