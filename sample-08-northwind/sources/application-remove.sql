-- =============================================
-- Application: Sample 08 - Northwind
-- Version 10.6, December 13, 2022
--
-- Copyright 2015-2022 Gartle LLC
--
-- License: MIT
-- =============================================

DELETE FROM objects             WHERE TABLE_NAME IN ('CustomerIndex', 'CustomersByIndex', 'OrderDetailsByOrderID', 'OrdersByCustomerID');
DELETE FROM translation         WHERE TABLE_NAME IN ('CustomerIndex', 'CustomersByIndex', 'OrderDetailsByOrderID', 'OrdersByCustomerID');
DELETE FROM formats             WHERE TABLE_NAME IN ('CustomerIndex', 'CustomersByIndex', 'OrderDetailsByOrderID', 'OrdersByCustomerID');
DELETE FROM handlers            WHERE TABLE_NAME IN ('CustomerIndex', 'CustomersByIndex', 'OrderDetailsByOrderID', 'OrdersByCustomerID');

DROP TABLE [Categories];
DROP TABLE [Customers];
DROP TABLE [Employees];
DROP TABLE [Shippers];
DROP TABLE [Suppliers];
DROP TABLE [Products];
DROP TABLE [Orders];
DROP TABLE [Order Details];

-- print Application removed
