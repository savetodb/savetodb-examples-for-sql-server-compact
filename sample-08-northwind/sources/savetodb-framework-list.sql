-- =============================================
-- SaveToDB Framework for Microsoft SQL Server Compact
-- Version 10.6, December 13, 2022
--
-- Copyright 2013-2022 Gartle LLC
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
