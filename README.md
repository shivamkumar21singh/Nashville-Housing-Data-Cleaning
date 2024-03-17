**# Nashville-Housing-Data-Cleaning**

This repository contains SQL queries for cleaning Nashville Housing data. The provided queries address various data cleaning tasks such as standardizing date formats, populating missing property addresses, breaking down addresses into individual columns, changing values in specific fields, and removing duplicates

**Data Cleaning Steps**

1) Standardize Date Format: Convert the SaleDate column to a standardized date format.

2) Populate Property Address Data: Populate missing property addresses by matching ParcelID values.

3) Break Out Address into Individual Columns: Split the PropertyAddress column into Address and City columns.

4) Split Owner Address: Split the OwnerAddress column into Address, City, and State columns.

5) Change Y and N to Yes and No: Update values in the SoldAsVacant field from 'Y' and 'N' to 'Yes' and 'No' respectively.

6) Remove Duplicates: Remove duplicate records based on specific criteria.

7) Delete Unused Column: Remove unnecessary columns from the dataset.
