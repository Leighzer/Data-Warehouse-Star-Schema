-- dimension tables
Create table [Time] (
TimeId uniqueidentifier not null Constraint [PK_Time_TimeId] Primary Key (TimeId) Constraint [DF_Time_TimeId] Default(NEWSEQUENTIALID()),
[Date] datetime2 not null Constraint [UQ_Time_Date] Unique([Date]),
[Day] int not null,
DayOfTheWeek int not null Constraint [CK_Time_DayOfTheWeek] check(DayOfTheWeek between 1 and 7),
[Month] int not null Constraint [CK_Time_Month] check([Month] between 1 and 12),
[Quarter] int not null Constraint [CK_Time_Quarter] check([Quarter] between 1 and 4),
[Year] int not null
)

Create table Branch (
BranchId uniqueidentifier not null Constraint [PK_Branch_BranchId] Primary Key (BranchId) Constraint [DF_Branch_BranchId] Default(NEWSEQUENTIALID()),
Name varchar(255) not null Constraint [UQ_Branch_Name] Unique(Name),
Type varchar(255) not null
)

Create table Item (
ItemId uniqueidentifier not null Constraint [PK_Item_ItemId] Primary Key (ItemId) Constraint [DF_Item_ItemId] Default(NEWSEQUENTIALID()),
Name varchar(255) not null,
Brand varchar(255) not null,
Type varchar(255) not null,
Supplier varchar(255) not null
)

Create table [Location] (
LocationId uniqueidentifier not null Constraint [PK_Location_LocationId] Primary Key (LocationId) Constraint [DF_Location_LocationId] Default(NEWSEQUENTIALID()),
Name varchar(255) not null Constraint [UQ_Location_Name] Unique(Name),
Street1 varchar(255) not null,
Street2 varchar(255) not null,
City varchar(255) not null,
[State] varchar(255) not null,
ZipCode varchar(9) not null,
Country varchar(255) not null
)

-- fact table with FK to each dimension table
Create table Sale (
SaleId uniqueidentifier not null Constraint [PK_Sale_SaleId] Primary Key (SaleId) Constraint [DF_Sale_SaleId] Default(NEWSEQUENTIALID()),
TimeId uniqueidentifier not null Constraint [FK_Sale_TimeId] Foreign Key (TimeId) References [Time](TimeId),
ItemId uniqueidentifier not null Constraint [FK_Sale_ItemId] Foreign Key (ItemId) References Item(ItemId),
BranchId uniqueidentifier not null Constraint [FK_Sale_BranchId] Foreign Key (BranchId) References Branch(BranchId),
LocationId uniqueidentifier not null Constraint [FK_Sale_LocationId] Foreign Key (LocationId) References [Location](LocationId),
DollarAmount money not null,
NumberOfUnits int not null
)

/*
select * from [Time]
select * from Branch
select * from Item
select * from [Location]
select * from Sale

drop table [Time]
drop table Branch
drop table Item
drop table [Location]
drop table Sale
*/
