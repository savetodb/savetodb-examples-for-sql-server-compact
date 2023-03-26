-- =============================================
-- SaveToDB Framework for Microsoft SQL Server Compact
-- Version 10.8, January 9, 2023
--
-- Copyright 2013-2023 Gartle LLC
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
