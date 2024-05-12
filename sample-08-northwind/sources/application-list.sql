-- =============================================
-- Application: Sample 08 - Northwind
-- Version 10.13, April 29, 2024
--
-- Copyright 2015-2024 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT t.TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLES t
WHERE
    t.TABLE_NAME NOT IN ('columns', 'objects', 'handlers', 'formats', 'translations', 'workbooks')
ORDER BY
    t.TABLE_NAME;
