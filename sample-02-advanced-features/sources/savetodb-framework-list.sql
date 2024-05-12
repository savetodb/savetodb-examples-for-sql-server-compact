-- =============================================
-- SaveToDB Framework for Microsoft SQL Server Compact
-- Version 10.13, April 29, 2024
--
-- Copyright 2013-2024 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT t.TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLES t
WHERE
    t.TABLE_NAME IN ('columns', 'formats', 'handlers', 'objects', 'translations', 'workbooks')
ORDER BY
    t.TABLE_NAME
