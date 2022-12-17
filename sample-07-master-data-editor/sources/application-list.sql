-- =============================================
-- Application: Sample 07 - Master Data Editor
-- Version 10.6, December 13, 2022
--
-- Copyright 2017-2022 Gartle LLC
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
