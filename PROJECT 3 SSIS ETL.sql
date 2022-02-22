CREATE DATABASE NorthwindDHW

GO
USE NorthwindDHW
GO

CREATE TABLE "DIMEmployees" (
	"EmployeeID" "int" IDENTITY (1, 1) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Title" nvarchar (30) NULL ,
	"City" nvarchar (15) NULL ,
	"Address" nvarchar (60) NULL ,
	"Region" nvarchar (15) NULL ,
	
	CONSTRAINT "PK_DEmployees" PRIMARY KEY  CLUSTERED 
	(
		"EmployeeID"
	),

	CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate())
)
GO

CREATE TABLE "DIMCustomers" (
	"CustomerID" Nchar(5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"Country" nvarchar (15) NULL ,
    "CustomerTypeID" NCHAR ( 10) NULL ,
	CONSTRAINT "PK_DCustomers" PRIMARY KEY  CLUSTERED 
	(
		"CustomerID"
	)
)
GO

CREATE TABLE "DIMProducts" (
	"ProductID" "int" IDENTITY (1, 1) NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"CategoryID" "int" NULL ,
	"CategoryNAME" NVARCHAR(15) NOT NULL ,
	"DESCRIPTION" NTEXT NULL ,
	"SupplierID" "int" NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Country" nvarchar (15) NULL ,

	"UnitPrice" "money" NULL CONSTRAINT "DF_Products_UnitPrice" DEFAULT (0),
	CONSTRAINT "PK_DProducts" PRIMARY KEY  CLUSTERED 
	(
		"ProductID"
	),
	CONSTRAINT "CK_DProducts_UnitPrice" CHECK (UnitPrice >= 0)
 )
GO

CREATE TABLE "FACTOrders" (
	"OrderID" "int"  NOT NULL ,
	"CustomerID" NCHAR(5)  NULL ,
	"EmployeeID" "int"  NULL ,
	"OrderDate" "datetime" NULL ,
	"RequiredDate" "datetime" NULL ,
	"ShippedDate" "datetime" NULL ,
	"ShipVia" "int" NULL ,
	"Freight" "money" NULL CONSTRAINT "DF_Orders_Freight" DEFAULT (0),
	"ShipName" nvarchar (40) NULL ,
	"ShipAddress" nvarchar (60) NULL ,
	"ShipCity" nvarchar (15) NULL ,
	"ShipRegion" nvarchar (15) NULL ,
	"ShipPostalCode" nvarchar (10) NULL ,
	"ShipCountry" nvarchar (15) NULL ,
	"ProductID" INT NULL ,
	"QUANTITY" NVARCHAR(20) NULL,
	"UnitPrice" "money" NULL CONSTRAINT "DF_DProducts_UnitPrice" DEFAULT (0),
	"DISCOUNT" REAL NOT NULL



	CONSTRAINT "FK_FOrders_Customers" FOREIGN KEY 
	(
		"CustomerID"
	) REFERENCES "dbo"."DIMCustomers" (
		"CustomerID"
	),
	CONSTRAINT "FK_FOrders_Employees" FOREIGN KEY 
	(
		"EmployeeID"
	) REFERENCES "dbo"."DIMEmployees" (
		"EmployeeID"
	),
	CONSTRAINT "FK_FOrders_PRODUCTS" FOREIGN KEY 
	(
		"Productid"
	) REFERENCES "dbo"."Dimproducts" (
		"Productid"
	)

)

