-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.6, December 13, 2022
--
-- Copyright 2014-2022 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE TABLE [cashbook] (
      [id] int IDENTITY(1,1) NOT NULL
    , [date] datetime NULL
    , [account] nvarchar(50) NULL
    , [item] nvarchar(50) NULL
    , [company] nvarchar(50) NULL
    , [debit] money NULL
    , [credit] money NULL
    , CONSTRAINT [PK_cashbook] PRIMARY KEY ([id])
);

CREATE TABLE formats (
    ID int IDENTITY(1,1) NOT NULL,
    TABLE_SCHEMA nvarchar(128),
    TABLE_NAME nvarchar(128) NOT NULL,
    TABLE_EXCEL_FORMAT_XML ntext,
  CONSTRAINT PK_formats PRIMARY KEY (ID)
);

CREATE UNIQUE INDEX ix_formats ON formats (TABLE_NAME);

CREATE TABLE workbooks (
    ID int IDENTITY(1,1) NOT NULL,
    NAME nvarchar(128) NOT NULL,
    TEMPLATE nvarchar(255),
    DEFINITION ntext NOT NULL,
    TABLE_SCHEMA nvarchar(128),
  CONSTRAINT PK_workbooks_xls PRIMARY KEY (ID)
);

CREATE UNIQUE INDEX IX_workbooks_name_xls ON workbooks (NAME);

SET IDENTITY_INSERT [cashbook] ON;
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (1, '20220110', N'Bank', N'Revenue', N'Customer C1', 200000, NULL);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (2, '20220110', N'Bank', N'Expenses', N'Supplier S1', NULL, 50000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (3, '20220131', N'Bank', N'Payroll', NULL, NULL, 85000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (4, '20220131', N'Bank', N'Taxes', N'Individual Income Tax', NULL, 15000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (5, '20220131', N'Bank', N'Taxes', N'Payroll Taxes', NULL, 15000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (6, '20220210', N'Bank', N'Revenue', N'Customer C1', 300000, NULL);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (7, '20220210', N'Bank', N'Revenue', N'Customer C2', 100000, NULL);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (8, '20220210', N'Bank', N'Expenses', N'Supplier S1', NULL, 100000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (9, '20220210', N'Bank', N'Expenses', N'Supplier S2', NULL, 50000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (10, '20220228', N'Bank', N'Payroll', NULL, NULL, 85000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (11, '20220228', N'Bank', N'Taxes', N'Individual Income Tax', NULL, 15000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (12, '20220228', N'Bank', N'Taxes', N'Payroll Taxes', NULL, 15000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (13, '20220310', N'Bank', N'Revenue', N'Customer C1', 300000, NULL);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (14, '20220310', N'Bank', N'Revenue', N'Customer C2', 200000, NULL);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (15, '20220310', N'Bank', N'Revenue', N'Customer C3', 100000, NULL);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (16, '20220315', N'Bank', N'Taxes', N'Corporate Income Tax', NULL, 100000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (17, '20220331', N'Bank', N'Payroll', NULL, NULL, 170000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (18, '20220331', N'Bank', N'Taxes', N'Individual Income Tax', NULL, 30000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (19, '20220331', N'Bank', N'Taxes', N'Payroll Taxes', NULL, 30000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (20, '20220331', N'Bank', N'Expenses', N'Supplier S1', NULL, 100000);
INSERT INTO [cashbook] ([id], [date], [account], [item], [company], [debit], [credit]) VALUES (21, '20220331', N'Bank', N'Expenses', N'Supplier S2', NULL, 50000);
SET IDENTITY_INSERT [cashbook] OFF;

INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'cashbook', N'<table name="cashbook"><columnFormats><column name="" property="ListObjectName" value="cashbook" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="Address" value="$E$4" type="String"/><column name="account" property="ColumnWidth" value="12.14" type="Double"/><column name="account" property="NumberFormat" value="General" type="String"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="Address" value="$F$4" type="String"/><column name="item" property="ColumnWidth" value="20.71" type="Double"/><column name="item" property="NumberFormat" value="General" type="String"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="Address" value="$G$4" type="String"/><column name="company" property="ColumnWidth" value="20.71" type="Double"/><column name="company" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');

INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 01 - Basic Features - User1.xlsx', N'https://www.savetodb.com/downloads/v10/sample01-user1.xlsx',
N'cashbook=cashbook,(Default),False,$B$3,,{"Parameters":{"account":null,"item":null,"company":null},"ListObjectName":"cashbook"}
', NULL);

-- print Application installed
