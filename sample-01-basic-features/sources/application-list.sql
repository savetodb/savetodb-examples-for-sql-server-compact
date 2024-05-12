-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.13, April 29, 2024
--
-- Copyright 2014-2024 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT t.TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLES t
ORDER BY
    t.TABLE_NAME;
