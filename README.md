**# Nashville-Housing-Data-Cleaning**

This repository contains SQL queries for cleaning Nashville Housing data. The provided queries address various data cleaning tasks such as standardizing date formats, populating missing property addresses, breaking down addresses into individual columns, changing values in specific fields, and removing duplicates

**Prerequisites**

To execute these SQL queries, you need access to a database management system (DBMS) such as MySQL, PostgreSQL, or Microsoft SQL Server. 

**Usage**

A) Import Excel Sheet into Database:

1) Before running the provided SQL queries, import the NashvilleHousing Excel sheet into your database.
  
2) You can use tools like MySQL Workbench, pgAdmin, or Microsoft SQL Server Management Studio to import the Excel sheet into a database table.

B) Execute SQL Queries:

  1) Open your preferred SQL client or command-line interface.
  2) Connect to the target database.
  3) Execute each SQL query provided in the repository sequentially to clean the Nashville Housing data.

C) Review Results:

  1) After executing each query, review the changes made to the dataset to ensure data quality and integrity

**Data Cleaning Steps**

1) Standardize Date Format: Convert the SaleDate column to a standardized date format.

2) Populate Property Address Data: Populate missing property addresses by matching ParcelID values.

3) Break Out Address into Individual Columns: Split the PropertyAddress column into Address and City columns.

4) Split Owner Address: Split the OwnerAddress column into Address, City, and State columns.

5) Change Y and N to Yes and No: Update values in the SoldAsVacant field from 'Y' and 'N' to 'Yes' and 'No' respectively.

6) Remove Duplicates: Remove duplicate records based on specific criteria.

7) Delete Unused Column: Remove unnecessary columns from the dataset.
