/* Cleaning Data in SQL Queries */

select *
from NashvilleHousing


--Standardize Date Format

select SaleDate, convert(Date,SaleDate)
from NashvilleHousing

update NashvilleHousing
set SaleDate=convert(Date,SaleDate)

alter table NashvilleHousing
add SaleDateConverted Date;

update NashvilleHousing
set SaleDateConverted=convert(Date,SaleDate)

select SaleDateConverted, convert(Date,SaleDate)
from NashvilleHousing


--Populate Property Address Data

select *
from NashvilleHousing
--where PropertyAddress is NULL
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
	on a.ParcelID=b.ParcelID
	and a.UniqueID<>b.UniqueID
where a.PropertyAddress is NULL

update a
set PropertyAddress=isnull(a.PropertyAddress,b.PropertyAddress)
from NashvilleHousing a
join NashvilleHousing b
	on a.ParcelID=b.ParcelID
	and a.UniqueID<>b.UniqueID
where a.PropertyAddress is NULL

select *
from NashvilleHousing
where PropertyAddress is NULL
order by ParcelID


--Breaking out Address into Individual Columns (Address, City, State)

select PropertyAddress
from NashvilleHousing

select
substring(PropertyAddress,1,charindex(',',PropertyAddress)-1) as Address,
substring(PropertyAddress,charindex(',',PropertyAddress)+1, len(PropertyAddress)) as Address
from NashvilleHousing

alter table NashvilleHousing
add PropertySplitAddress nvarchar(255);

update NashvilleHousing
set PropertySplitAddress=substring(PropertyAddress,1,charindex(',',PropertyAddress)-1)

alter table NashvilleHousing
add PropertySplitCity nvarchar(255);

update NashvilleHousing
set PropertySplitCity=substring(PropertyAddress,charindex(',',PropertyAddress)+1, len(PropertyAddress))

select PropertyAddress, PropertySplitAddress, PropertySplitCity
from NashvilleHousing


select OwnerAddress
from NashvilleHousing

select
Parsename(replace(OwnerAddress,',','.'),3),
Parsename(replace(OwnerAddress,',','.'),2),
Parsename(replace(OwnerAddress,',','.'),1)
from NashvilleHousing

alter table NashvilleHousing
add	OwnerSplitAddress nvarchar(255);

update NashvilleHousing
set OwnerSplitAddress=Parsename(replace(OwnerAddress,',','.'),3)

alter table NashvilleHousing
add	OwnerSplitCity nvarchar(255);

update NashvilleHousing
set OwnerSplitCity=Parsename(replace(OwnerAddress,',','.'),2)

alter table NashvilleHousing
add	OwnerSplitState nvarchar(255);

update NashvilleHousing
set OwnerSplitState=Parsename(replace(OwnerAddress,',','.'),1)

select OwnerAddress, OwnerSplitAddress, OwnerSplitCity, OwnerSplitState
from NashvilleHousing


--Change Y and N to Yes and No in "Sold as Vacant" field

select distinct(SoldAsVacant), count(SoldAsVacant)
from NashvilleHousing
group by SoldAsVacant
order by SoldAsVacant

select SoldAsVacant,
case
	when SoldAsVacant='Y' then 'Yes'
	when SoldAsVacant='N' then 'No'
	else SoldAsVacant
end
from NashvilleHousing

update NashvilleHousing
set SoldAsVacant=case
	when SoldAsVacant='Y' then 'Yes'
	when SoldAsVacant='N' then 'No'
	else SoldAsVacant
	end

select distinct(SoldAsVacant), count(SoldAsVacant)
from NashvilleHousing
group by SoldAsVacant
order by SoldAsVacant


--Remove Duplicates

select *
from NashvilleHousing

with RowNumCTE as(
select *,
	row_number() over(
	partition by ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
		order by UniqueID) row_num
from NashvilleHousing
--order by ParcelID
)
delete
from RowNumCTE
where row_num>1
--order by PropertyAddress


--Delete Unused Column

select *
from NashvilleHousing

alter table NashvilleHousing
drop column OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

select *
from NashvilleHousing
