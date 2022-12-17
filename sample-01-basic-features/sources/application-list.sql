-- =============================================
-- Application: Sample 01 - Basic SaveToDB Features
-- Version 10.6, December 13, 2022
--
-- Copyright 2014-2022 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT t.TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLES t
ORDER BY
    t.TABLE_NAME;
