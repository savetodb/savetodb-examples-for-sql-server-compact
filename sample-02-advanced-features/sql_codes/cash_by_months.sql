SELECT
    NULL AS sort_order
    , p.section
    , MAX(p.level) AS level
    , p.item_id
    , p.company_id
    , CASE WHEN p.company_id IS NULL THEN '' ELSE '  ' END + MAX(COALESCE(t1.TRANSLATED_NAME, p.name)) AS Name
    , CASE WHEN section = 1 THEN SUM(p.Jan) WHEN section = 5 THEN SUM(p.[Dec]) ELSE SUM(p.total) END AS Total
    , SUM(p.Jan) AS Jan
    , SUM(p.Feb) AS Feb
    , SUM(p.Mar) AS Mar
    , SUM(p.Apr) AS Apr
    , SUM(p.May) AS May
    , SUM(p.Jun) AS Jun
    , SUM(p.Jul) AS Jul
    , SUM(p.Aug) AS Aug
    , SUM(p.Sep) AS Sep
    , SUM(p.Oct) AS Oct
    , SUM(p.Nov) AS Nov
    , SUM(p.[Dec]) AS [Dec]
FROM
    (
    SELECT
        p.section
        , 2 AS level
        , p.item_id
        , p.company_id
        , MAX(p.name) AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN '01' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN '02' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN '03' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN '04' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN '05' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN '06' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN '07' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN '08' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN '09' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN '10' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN '11' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN '12' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS integer) AS section
            , p.item_id
            , p.company_id
            , c.name
            , DATEPART(MONTH, p.[date]) AS period
            , CASE WHEN p.credit IS NOT NULL THEN COALESCE(p.credit, 0) - COALESCE(p.debit, 0) ELSE COALESCE(p.debit, 0) - COALESCE(p.credit, 0) END AS amount
        FROM
            cashbook p
            LEFT OUTER JOIN items i ON i.id = p.item_id
            LEFT OUTER JOIN companies c ON c.id = p.company_id
        WHERE
            p.company_id IS NOT NULL
            AND DATEPART(YEAR, p.[date]) = CAST(@Year AS int)
        ) p
    GROUP BY
        p.section
        , p.item_id
        , p.company_id
        , p.period

    UNION ALL
    SELECT
        p.section
        , 1 AS level
        , p.item_id
        , NULL AS company_id
        , MAX(p.name) AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN '01' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN '02' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN '03' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN '04' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN '05' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN '06' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN '07' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN '08' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN '09' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN '10' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN '11' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN '12' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS integer) AS section
            , p.item_id
            , i.name
            , DATEPART(MONTH, p.[date]) AS period
            , CASE WHEN p.credit IS NOT NULL THEN COALESCE(p.credit, 0) - COALESCE(p.debit, 0) ELSE COALESCE(p.debit, 0) - COALESCE(p.credit, 0) END AS amount
        FROM
            cashbook p
            LEFT OUTER JOIN items i ON i.id = p.item_id
        WHERE
            p.item_id IS NOT NULL
            AND DATEPART(YEAR, p.[date]) = CAST(@Year AS int)
        ) p
    GROUP BY
        p.section,
        p.item_id,
        p.period

    UNION ALL
    SELECT
        p.section
        , 0 AS level
        , NULL AS item_id
        , NULL AS company_id
        , MAX(p.name) AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN '01' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN '02' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN '03' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN '04' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN '05' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN '06' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN '07' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN '08' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN '09' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN '10' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN '11' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN '12' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS integer) AS section
            , CAST(CASE WHEN p.credit IS NOT NULL THEN 'Total Expenses' ELSE 'Total Income' END AS nvarchar) AS name
            , DATEPART(MONTH, p.[date]) AS period
            , CASE WHEN p.credit IS NOT NULL THEN COALESCE(p.credit, 0) - COALESCE(p.debit, 0) ELSE COALESCE(p.debit, 0) - COALESCE(p.credit, 0) END AS amount
        FROM
            cashbook p
        WHERE
            DATEPART(YEAR, p.[date]) = CAST(@Year AS int)
        ) p
    GROUP BY
        p.section,
        p.period

    UNION ALL
    SELECT
        4 AS section
        , 0 AS level
        , NULL AS item_id
        , NULL AS company_id
        , 'Net Change' AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN '01' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN '02' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN '03' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN '04' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN '05' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN '06' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN '07' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN '08' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN '09' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN '10' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN '11' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN '12' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            DATEPART(MONTH, p.[date]) AS period
            , COALESCE(p.debit, 0) - COALESCE(p.credit, 0) AS amount
        FROM
            cashbook p
        WHERE
            DATEPART(YEAR, p.[date]) = CAST(@Year AS int)
        ) p
    GROUP BY
        p.period

    UNION ALL
    SELECT
        1 AS section
        , 0 AS level
        , NULL AS item_id
        , NULL AS company_id
        , 'Opening Balance' AS name
        , p.period
        , NULL AS total
        , CASE p.period WHEN '01' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN '02' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN '03' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN '04' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN '05' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN '06' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN '07' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN '08' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN '09' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN '10' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN '11' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN '12' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            DATEPART(MONTH, d.[date]) AS period
            , SUM(COALESCE(p.debit, 0) - COALESCE(p.credit, 0)) AS amount
        FROM
            cashbook p
            CROSS JOIN (
                SELECT CAST(CAST(@Year AS nvarchar) + '-01-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-02-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-03-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-04-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-05-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-06-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-07-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-08-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-09-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-10-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-11-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-12-01' AS datetime) AS [date]
            ) d
        WHERE
            p.[date] < d.[date]
        GROUP BY
            DATEPART(MONTH, d.[date])
        ) p
    GROUP BY
        p.period

    UNION ALL
    SELECT
        5 AS section
        , 0 AS level
        , NULL AS item_id
        , NULL AS company_id
        , 'Closing Balance' AS name
        , p.period
        , NULL AS total
        , CASE p.period WHEN '02' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN '03' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN '04' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN '05' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN '06' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN '07' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN '08' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN '09' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN '10' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN '11' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN '12' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN '01' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            DATEPART(MONTH, d.[date]) AS period
            , SUM(COALESCE(p.debit, 0) - COALESCE(p.credit, 0)) AS amount
        FROM
            cashbook p
            CROSS JOIN (
                SELECT CAST(CAST(@Year AS nvarchar) + '-02-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-03-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-04-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-05-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-06-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-07-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-08-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-09-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-10-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-11-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + '-12-01' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year + 1 AS nvarchar) + '-01-01' AS datetime) AS [date]
            ) d
        WHERE
            p.[date] < d.[date]
        GROUP BY
            DATEPART(MONTH, d.[date])
        ) p
    GROUP BY
        p.period
    ) p
    LEFT OUTER JOIN translations t1 ON t1.TABLE_NAME = 'strings' AND t1.COLUMN_NAME = p.name AND t1.LANGUAGE_NAME = @data_language
GROUP BY
    p.section
    , p.item_id
    , p.company_id
ORDER BY
    section
    , item_id
    , company_id
