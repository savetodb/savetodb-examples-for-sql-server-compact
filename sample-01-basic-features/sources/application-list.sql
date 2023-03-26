-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.8, January 9, 2023
--
-- Copyright 2014-2023 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT t.TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLES t
ORDER BY
    t.TABLE_NAME;
