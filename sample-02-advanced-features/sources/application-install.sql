-- =============================================
-- Application: Sample 02 - Advanced SaveToDB Features
-- Version 10.6, December 13, 2022
--
-- Copyright 2017-2022 Gartle LLC
--
-- License: MIT
--
-- Prerequisites: SaveToDB Framework 10.0 or higher
-- =============================================

CREATE TABLE accounts (
      id int IDENTITY(1,1) NOT NULL
    , name nvarchar(50) NOT NULL
    , CONSTRAINT PK_accounts PRIMARY KEY (id)
    , CONSTRAINT IX_accounts_name UNIQUE (name)
);

CREATE TABLE companies (
      id int IDENTITY(1,1) NOT NULL
    , name nvarchar(50) NOT NULL
    , CONSTRAINT PK_companies PRIMARY KEY (id)
);

CREATE INDEX IX_companies_name ON companies (name);

CREATE TABLE items (
      id int IDENTITY(1,1) NOT NULL
    , name nvarchar(50) NOT NULL
    , CONSTRAINT PK_items PRIMARY KEY (id)
    , CONSTRAINT IX_items_name UNIQUE (name)
);

CREATE TABLE cashbook (
      id int IDENTITY(1,1) NOT NULL
    , date datetime NOT NULL
    , account_id int NOT NULL
    , item_id int NULL
    , company_id int NULL
    , debit money NULL
    , credit money NULL
    , checked bit NULL
    , CONSTRAINT PK_cashbook PRIMARY KEY (id)
);

ALTER TABLE cashbook ADD CONSTRAINT FK_cashbook_accounts FOREIGN KEY (account_id) REFERENCES accounts (id) ON UPDATE CASCADE;

ALTER TABLE cashbook ADD CONSTRAINT FK_cashbook_companies FOREIGN KEY (company_id) REFERENCES companies (id) ON UPDATE CASCADE;

ALTER TABLE cashbook ADD CONSTRAINT FK_cashbook_items FOREIGN KEY (item_id) REFERENCES items (id) ON UPDATE CASCADE;

CREATE TABLE item_companies (
      item_id int NOT NULL
    , company_id int NOT NULL
    , CONSTRAINT PK_item_companies PRIMARY KEY (item_id, company_id)
);

ALTER TABLE item_companies ADD CONSTRAINT FK_item_companies_companies FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE item_companies ADD CONSTRAINT FK_item_companies_items FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE ON UPDATE CASCADE;

SET IDENTITY_INSERT accounts ON;
INSERT INTO accounts (id, name) VALUES (1, 'Bank');
SET IDENTITY_INSERT accounts OFF;

SET IDENTITY_INSERT items ON;
INSERT INTO items (id, name) VALUES (1, 'Revenue');
INSERT INTO items (id, name) VALUES (2, 'Expenses');
INSERT INTO items (id, name) VALUES (3, 'Payroll');
INSERT INTO items (id, name) VALUES (4, 'Taxes');
SET IDENTITY_INSERT items OFF;

SET IDENTITY_INSERT companies ON;
INSERT INTO companies (id, name) VALUES (1, 'Customer C1');
INSERT INTO companies (id, name) VALUES (2, 'Customer C2');
INSERT INTO companies (id, name) VALUES (3, 'Customer C3');
INSERT INTO companies (id, name) VALUES (4, 'Customer C4');
INSERT INTO companies (id, name) VALUES (5, 'Customer C5');
INSERT INTO companies (id, name) VALUES (6, 'Customer C6');
INSERT INTO companies (id, name) VALUES (7, 'Customer C7');
INSERT INTO companies (id, name) VALUES (8, 'Supplier S1');
INSERT INTO companies (id, name) VALUES (9, 'Supplier S2');
INSERT INTO companies (id, name) VALUES (10, 'Supplier S3');
INSERT INTO companies (id, name) VALUES (11, 'Supplier S4');
INSERT INTO companies (id, name) VALUES (12, 'Supplier S5');
INSERT INTO companies (id, name) VALUES (13, 'Supplier S6');
INSERT INTO companies (id, name) VALUES (14, 'Supplier S7');
INSERT INTO companies (id, name) VALUES (15, 'Corporate Income Tax');
INSERT INTO companies (id, name) VALUES (16, 'Individual Income Tax');
INSERT INTO companies (id, name) VALUES (17, 'Payroll Taxes');
SET IDENTITY_INSERT companies OFF;

INSERT INTO item_companies (item_id, company_id) VALUES (1, 1);
INSERT INTO item_companies (item_id, company_id) VALUES (1, 2);
INSERT INTO item_companies (item_id, company_id) VALUES (1, 3);
INSERT INTO item_companies (item_id, company_id) VALUES (1, 4);
INSERT INTO item_companies (item_id, company_id) VALUES (1, 5);
INSERT INTO item_companies (item_id, company_id) VALUES (1, 6);
INSERT INTO item_companies (item_id, company_id) VALUES (1, 7);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 8);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 9);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 10);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 11);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 12);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 13);
INSERT INTO item_companies (item_id, company_id) VALUES (2, 14);
INSERT INTO item_companies (item_id, company_id) VALUES (4, 15);
INSERT INTO item_companies (item_id, company_id) VALUES (4, 16);
INSERT INTO item_companies (item_id, company_id) VALUES (4, 17);

INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-01-10', 1, 1, 1, 200000, NULL, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-01-10', 1, 2, 8, NULL, 50000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-01-31', 1, 3, NULL, NULL, 85000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-01-31', 1, 4, 16, NULL, 15000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-01-31', 1, 4, 17, NULL, 15000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-10', 1, 1, 1, 300000, NULL, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-10', 1, 1, 2, 100000, NULL, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-10', 1, 2, 9, NULL, 50000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-10', 1, 2, 8, NULL, 100000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-28', 1, 3, NULL, NULL, 85000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-28', 1, 4, 16, NULL, 15000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-02-28', 1, 4, 17, NULL, 15000, 1);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-10', 1, 1, 1, 300000, NULL, 0);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-10', 1, 1, 2, 200000, NULL, 0);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-10', 1, 1, 3, 100000, NULL, 0);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-15', 1, 4, 15, NULL, 100000, NULL);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-31', 1, 3, NULL, NULL, 170000, NULL);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-31', 1, 4, 16, NULL, 30000, NULL);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-31', 1, 4, 17, NULL, 30000, NULL);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-31', 1, 2, 9, NULL, 50000, NULL);
INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES ('2022-03-31', 1, 2, 8, NULL, 100000, NULL);

INSERT INTO objects (TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, TABLE_CODE, INSERT_OBJECT, UPDATE_OBJECT, DELETE_OBJECT) VALUES (NULL, 'usp_cash_by_months', 'CODE', 'SELECT
    NULL AS sort_order
    , p.section
    , MAX(p.level) AS level
    , p.item_id
    , p.company_id
    , CASE WHEN p.company_id IS NULL THEN '''' ELSE ''  '' END + MAX(COALESCE(t1.TRANSLATED_NAME, p.name)) AS Name
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
        , CASE p.period WHEN ''01'' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN ''02'' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN ''03'' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN ''04'' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN ''05'' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN ''06'' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN ''07'' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN ''08'' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN ''09'' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN ''10'' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN ''11'' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN ''12'' THEN SUM(p.amount) ELSE NULL END AS [Dec]
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
        , CASE p.period WHEN ''01'' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN ''02'' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN ''03'' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN ''04'' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN ''05'' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN ''06'' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN ''07'' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN ''08'' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN ''09'' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN ''10'' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN ''11'' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN ''12'' THEN SUM(p.amount) ELSE NULL END AS [Dec]
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
        , CASE p.period WHEN ''01'' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN ''02'' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN ''03'' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN ''04'' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN ''05'' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN ''06'' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN ''07'' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN ''08'' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN ''09'' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN ''10'' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN ''11'' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN ''12'' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            CAST(CASE WHEN p.credit IS NOT NULL THEN 3 ELSE 2 END AS integer) AS section
            , CAST(CASE WHEN p.credit IS NOT NULL THEN ''Total Expenses'' ELSE ''Total Income'' END AS nvarchar) AS name
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
        , ''Net Change'' AS name
        , p.period
        , SUM(p.amount) AS total
        , CASE p.period WHEN ''01'' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN ''02'' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN ''03'' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN ''04'' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN ''05'' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN ''06'' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN ''07'' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN ''08'' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN ''09'' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN ''10'' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN ''11'' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN ''12'' THEN SUM(p.amount) ELSE NULL END AS [Dec]
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
        , ''Opening Balance'' AS name
        , p.period
        , NULL AS total
        , CASE p.period WHEN ''01'' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN ''02'' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN ''03'' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN ''04'' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN ''05'' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN ''06'' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN ''07'' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN ''08'' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN ''09'' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN ''10'' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN ''11'' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN ''12'' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            DATEPART(MONTH, d.[date]) AS period
            , SUM(COALESCE(p.debit, 0) - COALESCE(p.credit, 0)) AS amount
        FROM
            cashbook p
            CROSS JOIN (
                SELECT CAST(CAST(@Year AS nvarchar) + ''-01-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-02-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-03-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-04-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-05-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-06-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-07-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-08-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-09-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-10-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-11-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-12-01'' AS datetime) AS [date]
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
        , ''Closing Balance'' AS name
        , p.period
        , NULL AS total
        , CASE p.period WHEN ''02'' THEN SUM(p.amount) ELSE NULL END AS Jan
        , CASE p.period WHEN ''03'' THEN SUM(p.amount) ELSE NULL END AS Feb
        , CASE p.period WHEN ''04'' THEN SUM(p.amount) ELSE NULL END AS Mar
        , CASE p.period WHEN ''05'' THEN SUM(p.amount) ELSE NULL END AS Apr
        , CASE p.period WHEN ''06'' THEN SUM(p.amount) ELSE NULL END AS May
        , CASE p.period WHEN ''07'' THEN SUM(p.amount) ELSE NULL END AS Jun
        , CASE p.period WHEN ''08'' THEN SUM(p.amount) ELSE NULL END AS Jul
        , CASE p.period WHEN ''09'' THEN SUM(p.amount) ELSE NULL END AS Aug
        , CASE p.period WHEN ''10'' THEN SUM(p.amount) ELSE NULL END AS Sep
        , CASE p.period WHEN ''11'' THEN SUM(p.amount) ELSE NULL END AS Oct
        , CASE p.period WHEN ''12'' THEN SUM(p.amount) ELSE NULL END AS Nov
        , CASE p.period WHEN ''01'' THEN SUM(p.amount) ELSE NULL END AS [Dec]
    FROM
        (
        SELECT
            DATEPART(MONTH, d.[date]) AS period
            , SUM(COALESCE(p.debit, 0) - COALESCE(p.credit, 0)) AS amount
        FROM
            cashbook p
            CROSS JOIN (
                SELECT CAST(CAST(@Year AS nvarchar) + ''-02-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-03-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-04-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-05-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-06-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-07-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-08-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-09-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-10-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-11-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year AS nvarchar) + ''-12-01'' AS datetime) AS [date]
                UNION SELECT CAST(CAST(@Year + 1 AS nvarchar) + ''-01-01'' AS datetime) AS [date]
            ) d
        WHERE
            p.[date] < d.[date]
        GROUP BY
            DATEPART(MONTH, d.[date])
        ) p
    GROUP BY
        p.period
    ) p
    LEFT OUTER JOIN translations t1 ON t1.TABLE_NAME = ''strings'' AND t1.COLUMN_NAME = p.name AND t1.LANGUAGE_NAME = CAST(@data_language AS nvarchar)
GROUP BY
    p.section
    , p.item_id
    , p.company_id
ORDER BY
    section
    , item_id
    , company_id
', NULL, NULL, NULL);

INSERT INTO objects (TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, TABLE_CODE, INSERT_OBJECT, UPDATE_OBJECT, DELETE_OBJECT) VALUES (NULL, 'code_cashbook', 'CODE', 'SELECT
    t.id
    , t.date
    , t.account_id
    , t.item_id
    , t.company_id
    , t.debit
    , t.credit
    , t.checked
FROM
    cashbook t
WHERE
    COALESCE(CAST(@account_id AS int), t.account_id, -1) = COALESCE(t.account_id, -1)
    AND COALESCE(CAST(@item_id AS int), t.item_id, -1) = COALESCE(t.item_id, -1)
    AND COALESCE(CAST(@company_id AS int), t.company_id, -1) = COALESCE(t.company_id, -1)
    AND t.date BETWEEN COALESCE(CAST(@start_date AS datetime), ''20200101'') AND COALESCE(CAST(@end_date AS datetime), ''20490101'')
    AND (CAST(@checked AS bit) IS NULL OR t.checked = CAST(@checked AS bit))', 'INSERT INTO cashbook (date, account_id, item_id, company_id, debit, credit, checked) VALUES (@date, @account_id, @item_id, @company_id, @debit, @credit, @checked)', 'UPDATE cashbook SET date = @date, account_id = @account_id, item_id = @item_id, company_id = @company_id, debit = @debit, credit = @credit, checked = @checked WHERE id = @id', 'DELETE FROM cashbook WHERE id = @id');

INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'cashbook', 'date', 'SelectPeriod', NULL, NULL, 'ATTRIBUTE', NULL, 'HideWeeks HideYears', NULL, NULL);

INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'start_date', 'SelectPeriod', NULL, NULL, 'ATTRIBUTE', NULL, 'end_date HideWeeks HideYears', NULL, NULL);

INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', NULL, 'Actions', NULL, 'See Online Help', 'HTTP', 'https://www.savetodb.com/samples/sample02-code_cashbook', NULL, NULL, NULL);
INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'account_id', 'ParameterValues', NULL, 'xl_list_account_id_code', 'CODE', 'SELECT
    m.id
    , COALESCE(t.TRANSLATED_NAME, m.name) AS name
FROM
    accounts m
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = m.name
ORDER BY
    name', NULL, NULL, NULL);
INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'company_id', 'ParameterValues', NULL, 'xl_list_company_id_for_item_id_code', 'CODE', 'SELECT
    m.id
    , COALESCE(t.TRANSLATED_NAME, m.name) AS name
FROM
    companies m
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = m.name
WHERE
    CAST(@item_id AS int) IS NULL
UNION ALL
SELECT
    c.id
    , COALESCE(t.TRANSLATED_NAME, c.name) AS name
FROM
    item_companies ic
    INNER JOIN companies c ON c.id = ic.company_id
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = c.name
WHERE
    ic.item_id = CAST(@item_id AS int)
ORDER BY
    name', NULL, NULL, NULL);
INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'item_id', 'ParameterValues', NULL, 'xl_list_item_id_code', 'CODE', 'SELECT
    m.id
    , COALESCE(t.TRANSLATED_NAME, m.name) AS name
FROM
    items m
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = m.name
ORDER BY
    name', NULL, NULL, NULL);
INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'account_id', 'ValidationList', NULL, 'xl_list_account_id_code', 'CODE', 'SELECT
    m.id
    , COALESCE(t.TRANSLATED_NAME, m.name) AS name
FROM
    accounts m
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = m.name
ORDER BY
    name', NULL, NULL, NULL);
INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'company_id', 'ValidationList', NULL, 'xl_list_company_id_with_item_id_code', 'CODE', 'SELECT
    c.id
    , COALESCE(t.TRANSLATED_NAME, c.name) AS name
    , ic.item_id
FROM
    item_companies ic
    INNER JOIN companies c ON c.id = ic.company_id
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = c.name
ORDER BY
    ic.item_id
    , name', NULL, NULL, NULL);
INSERT INTO handlers (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES (NULL, 'code_cashbook', 'item_id', 'ValidationList', NULL, 'xl_list_item_id_code', 'CODE', 'SELECT
    m.id
    , COALESCE(t.TRANSLATED_NAME, m.name) AS name
FROM
    items m
    LEFT OUTER JOIN translations t ON t.TABLE_NAME = ''strings''
            AND t.LANGUAGE_NAME = CAST(@data_language AS nvarchar) AND t.COLUMN_NAME = m.name
ORDER BY
    name', NULL, NULL, NULL);

INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'de', N'Konto', N'', N'');
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'de', N'Konto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'de', N'Apr.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'de', N'Aug.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'de', N'Balance', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'de', N'Überprüft', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'de', N'Unternehmen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'de', N'Unternehmen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'de', N'Kosten', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'de', N'Datum', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'de', N'Tag', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'de', N'Einkommen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'de', N'Dez.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'de', N'Endtermin', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'de', N'Feb.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'de', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'de', N'Artikel', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'de', N'Artikel', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'de', N'Jan.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'de', N'Juli', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'de', N'Juni', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'de', N'Niveau', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'de', N'März', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'de', N'Mai', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'de', N'Monat', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'de', N'Name', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'de', N'Nov.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'de', N'Okt.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'de', N'Sektion', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'de', N'Sept.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'de', N'Sortierung', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'de', N'Startdatum', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'de', N'Jahr', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'de', N'Konten', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'de', N'Kassenbuch', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'de', N'Kassenbuch (SQL-Code)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'de', N'Unternehmen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'de', N'Artikel und Firmen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'de', N'Artikel', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'de', N'Bank', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'de', N'Schlussbilanz', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'de', N'Körperschaftssteuer', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'de', N'Kunde C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'de', N'Kunde C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'de', N'Kunde C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'de', N'Kunde C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'de', N'Kunde C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'de', N'Kunde C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'de', N'Kunde C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'de', N'Kosten', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'de', N'Lohnsteuer', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'de', N'Nettoveränderung', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'de', N'Anfangsbestand', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'de', N'Lohn-und Gehaltsabrechnung', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'de', N'Sozialabgaben', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'de', N'Einnahmen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'de', N'Lieferant S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'de', N'Lieferant S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'de', N'Lieferant S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'de', N'Lieferant S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'de', N'Lieferant S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'de', N'Lieferant S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'de', N'Lieferant S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'de', N'Steuern', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'de', N'Gesamtausgaben', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'de', N'Gesamteinkommen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'de', N'Bargeld nach Monaten', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'de', N'Firmen-ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'de', N'Artikel-ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'de', N'Translationen', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'de', N'Einzelheiten', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'en', N'Account', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'en', N'Account', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'en', N'Apr', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'en', N'Aug', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'en', N'Balance', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'en', N'Checked', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'en', N'Company', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'en', N'Company', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'en', N'Expenses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'en', N'Date', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'en', N'Day', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'en', N'Income', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'en', N'Dec', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'en', N'End Date', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'en', N'Feb', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'en', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'en', N'Item', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'en', N'Item', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'en', N'Jan', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'en', N'Jul', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'en', N'Jun', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'en', N'Level', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'en', N'Mar', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'en', N'May', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'en', N'Month', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'en', N'Name', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'en', N'Nov', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'en', N'Oct', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'en', N'Section', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'en', N'Sep', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'en', N'Sort Order', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'en', N'Start Date', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'en', N'Year', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'en', N'Accounts', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'en', N'Cashbook', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'en', N'Cashbook (SQL code)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'en', N'Companies', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'en', N'Item and Companies', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'en', N'Items', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'en', N'Bank', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'en', N'Closing Balance', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'en', N'Corporate Income Tax', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'en', N'Customer C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'en', N'Customer C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'en', N'Customer C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'en', N'Customer C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'en', N'Customer C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'en', N'Customer C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'en', N'Customer C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'en', N'Expenses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'en', N'Individual Income Tax', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'en', N'Net Change', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'en', N'Opening Balance', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'en', N'Payroll', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'en', N'Payroll Taxes', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'en', N'Revenue', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'en', N'Supplier S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'en', N'Supplier S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'en', N'Supplier S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'en', N'Supplier S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'en', N'Supplier S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'en', N'Supplier S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'en', N'Supplier S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'en', N'Taxes', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'en', N'Total Expenses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'en', N'Total Income', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'en', N'Cash by Months', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'en', N'Company Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'en', N'Item Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'en', N'Translations', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'en', N'Details', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'es', N'Cuenta', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'es', N'Cuenta', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'es', N'Abr.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'es', N'Agosto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'es', N'Equilibrio', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'es', N'Comprobado', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'es', N'Empresa', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'es', N'Empresa', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'es', N'Gasto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'es', N'Fecha', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'es', N'Día', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'es', N'Ingresos', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'es', N'Dic.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'es', N'Fecha final', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'es', N'Feb.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'es', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'es', N'Artículo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'es', N'Artículo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'es', N'Enero', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'es', N'Jul.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'es', N'Jun.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'es', N'Nivel', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'es', N'Marzo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'es', N'Mayo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'es', N'Mes', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'es', N'Nombre', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'es', N'Nov.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'es', N'Oct.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'es', N'Sección', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'es', N'Sept.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'es', N'Orden', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'es', N'Fecha de inicio', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'es', N'Año', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'es', N'Cuentas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'es', N'Libro de caja', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'es', N'Libro de caja (código SQL)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'es', N'Compañías', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'es', N'Artículo y empresas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'es', N'Artículos', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'es', N'Banco', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'es', N'Balance de cierre', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'es', N'Impuesto sobre Sociedades', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'es', N'Cliente C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'es', N'Cliente C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'es', N'Cliente C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'es', N'Cliente C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'es', N'Cliente C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'es', N'Cliente C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'es', N'Cliente C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'es', N'Gasto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'es', N'IRPF', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'es', N'Cambio neto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'es', N'Saldo de apertura', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'es', N'Salario', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'es', N'Cargas sociales', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'es', N'Ingresos', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'es', N'Abastecedor A1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'es', N'Abastecedor A2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'es', N'Abastecedor A3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'es', N'Abastecedor A4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'es', N'Abastecedor A5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'es', N'Abastecedor A6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'es', N'Abastecedor A7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'es', N'Impuestos', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'es', N'Gasto total', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'es', N'Ingresos totales', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'es', N'Efectivo por meses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'es', N'ID de empresa', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'es', N'ID del artículo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'es', N'Traducciones', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'es', N'Detalles', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'fr', N'Compte', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'fr', N'Compte', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'fr', N'Avril', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'fr', N'Août', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'fr', N'Solde', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'fr', N'Vérifié', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'fr', N'Entreprise', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'fr', N'Entreprise', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'fr', N'Dépenses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'fr', N'Date', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'fr', N'Journée', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'fr', N'Revenu', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'fr', N'Déc.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'fr', N'Date de fin', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'fr', N'Févr.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'fr', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'fr', N'Article', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'fr', N'Article', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'fr', N'Janv.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'fr', N'Juil.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'fr', N'Juin', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'fr', N'Niveau', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'fr', N'Mars', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'fr', N'Mai', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'fr', N'Mois', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'fr', N'Prénom', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'fr', N'Nov.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'fr', N'Oct.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'fr', N'Section', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'fr', N'Sept.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'fr', N'Ordre de tri', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'fr', N'Date de début', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'fr', N'Année', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'fr', N'Comptes', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'fr', N'Livre de caisse', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'fr', N'Livre de caisse (code SQL)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'fr', N'Entreprises', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'fr', N'Article et sociétés', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'fr', N'Articles', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'fr', N'Banque', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'fr', N'Solde de clôture', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'fr', N'Impôt sur les sociétés', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'fr', N'Client 01', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'fr', N'Client 02', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'fr', N'Client 03', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'fr', N'Client 04', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'fr', N'Client 05', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'fr', N'Client 06', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'fr', N'Client 07', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'fr', N'Dépenses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'fr', N'Impôt sur le revenu', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'fr', N'Changement net', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'fr', N'Solde d''ouverture', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'fr', N'Paie', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'fr', N'Charges sociales', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'fr', N'Revenu', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'fr', N'Fournisseur 01', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'fr', N'Fournisseur 02', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'fr', N'Fournisseur 03', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'fr', N'Fournisseur 04', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'fr', N'Fournisseur 05', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'fr', N'Fournisseur 06', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'fr', N'Fournisseur 07', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'fr', N'Taxes', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'fr', N'Dépenses totales', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'fr', N'Revenu total', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'fr', N'Cash par mois', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'fr', N'ID de l''entreprise', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'fr', N'ID de l''article', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'fr', N'Traductions', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'fr', N'Détails', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'it', N'Conto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'it', N'Conto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'it', N'Apr.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'it', N'Ag.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'it', N'Saldo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'it', N'Controllato', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'it', N'Azienda', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'it', N'Azienda', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'it', N'Credito', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'it', N'Data', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'it', N'Giorno', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'it', N'Debito', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'it', N'Dic.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'it', N'Data di fine', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'it', N'Febbr.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'it', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'it', N'Articolo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'it', N'Articolo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'it', N'Genn.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'it', N'Luglio', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'it', N'Giugno', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'it', N'Livello', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'it', N'Mar.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'it', N'Magg.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'it', N'Mese', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'it', N'Conome', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'it', N'Nov.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'it', N'Ott.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'it', N'Sezione', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'it', N'Sett.', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'it', N'Ordinamento', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'it', N'Data d''inizio', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'it', N'Anno', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'it', N'Conti', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'it', N'Cashbook', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'it', N'Cashbook (codice SQL)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'it', N'Aziende', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'it', N'Articolo e società', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'it', N'Elementi', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'it', N'Banca', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'it', N'Saldo finale', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'it', N'Imposta sul reddito delle società', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'it', N'Cliente C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'it', N'Cliente C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'it', N'Cliente C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'it', N'Cliente C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'it', N'Cliente C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'it', N'Cliente C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'it', N'Cliente C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'it', N'Spese', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'it', N'IRPEF', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'it', N'Cambio netto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'it', N'Saldo iniziale', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'it', N'Paga', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'it', N'Imposte sui salari', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'it', N'Reddito', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'it', N'Fornitore F1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'it', N'Fornitore F2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'it', N'Fornitore F3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'it', N'Fornitore F4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'it', N'Fornitore F5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'it', N'Fornitore F6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'it', N'Fornitore F7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'it', N'Tasse', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'it', N'Spese totale', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'it', N'Reddito totale', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'it', N'Contanti per mesi', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'it', N'ID dell''azienda', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'it', N'ID articolo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'it', N'Traduzioni', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'it', N'Dettagli', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'ja', N'アカウント', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'ja', N'アカウント', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'ja', N'4月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'ja', N'8月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'ja', N'バランス', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'ja', N'チェック済み', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'ja', N'会社', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'ja', N'会社', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'ja', N'経費', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'ja', N'日付', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'ja', N'日', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'ja', N'所得', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'ja', N'12月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'ja', N'終了日', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'ja', N'2月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'ja', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'ja', N'アイテム', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'ja', N'アイテム', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'ja', N'1月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'ja', N'7月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'ja', N'6月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'ja', N'レベル', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'ja', N'3月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'ja', N'5月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'ja', N'月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'ja', N'名', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'ja', N'11月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'ja', N'10月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'ja', N'セクション', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'ja', N'9月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'ja', N'並べ替え順序', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'ja', N'開始日', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'ja', N'年', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'ja', N'アカウント', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'ja', N'キャッシュブック', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'ja', N'キャッシュブック（SQLコード）', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'ja', N'会社', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'ja', N'アイテムと会社', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'ja', N'アイテム', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'ja', N'銀行', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'ja', N'クロージングバランス', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'ja', N'法人所得税', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'ja', N'顧客C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'ja', N'顧客C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'ja', N'顧客C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'ja', N'顧客C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'ja', N'顧客C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'ja', N'顧客C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'ja', N'顧客C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'ja', N'経費', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'ja', N'個人所得税', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'ja', N'正味変化', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'ja', N'オープニングバランス', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'ja', N'給与', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'ja', N'給与税', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'ja', N'収益', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'ja', N'サプライヤーS1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'ja', N'サプライヤーS2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'ja', N'サプライヤーS3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'ja', N'サプライヤーS4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'ja', N'サプライヤーS5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'ja', N'サプライヤーS6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'ja', N'サプライヤーS7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'ja', N'税金', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'ja', N'総費用', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'ja', N'総収入', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'ja', N'月ごとの現金', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'ja', N'会社ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'ja', N'アイテムID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'ja', N'翻訳', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'ja', N'詳細', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'ko', N'계정', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'ko', N'계정', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'ko', N'4월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'ko', N'8월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'ko', N'균형', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'ko', N'확인됨', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'ko', N'회사', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'ko', N'회사', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'ko', N'소요 경비', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'ko', N'날짜', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'ko', N'하루', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'ko', N'소득', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'ko', N'12월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'ko', N'종료일', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'ko', N'2월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'ko', N'ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'ko', N'아이템', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'ko', N'아이템', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'ko', N'1월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'ko', N'7월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'ko', N'6월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'ko', N'수준', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'ko', N'3월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'ko', N'5월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'ko', N'월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'ko', N'이름', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'ko', N'11월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'ko', N'10월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'ko', N'섹션', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'ko', N'9월', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'ko', N'정렬 순서', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'ko', N'시작일', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'ko', N'년', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'ko', N'계정', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'ko', N'캐쉬북', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'ko', N'캐쉬북(SQL 코드)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'ko', N'회사', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'ko', N'아이템 및 회사', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'ko', N'아이템', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'ko', N'은행', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'ko', N'폐쇄 균형', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'ko', N'법인 소득세', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'ko', N'고객 C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'ko', N'고객 C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'ko', N'고객 C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'ko', N'고객 C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'ko', N'고객 C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'ko', N'고객 C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'ko', N'고객 C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'ko', N'소요 경비', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'ko', N'개인소득세', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'ko', N'순 변화', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'ko', N'기초 잔액', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'ko', N'월급', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'ko', N'급여 세금', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'ko', N'수익', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'ko', N'공급 업체 S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'ko', N'공급 업체 S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'ko', N'공급 업체 S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'ko', N'공급 업체 S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'ko', N'공급 업체 S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'ko', N'공급 업체 S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'ko', N'공급 업체 S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'ko', N'세금', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'ko', N'총 경비', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'ko', N'총 수입', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'ko', N'월별 현금', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'ko', N'회사 ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'ko', N'항목 ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'ko', N'번역', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'ko', N'세부', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'pt', N'Conta', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'pt', N'Conta', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'pt', N'Abr', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'pt', N'Agosto', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'pt', N'Saldo', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'pt', N'Verificado', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'pt', N'Companhia', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'pt', N'Companhia', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'pt', N'Despesas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'pt', N'Encontro', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'pt', N'Dia', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'pt', N'Renda', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'pt', N'Dez', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'pt', N'Data final', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'pt', N'Fev', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'pt', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'pt', N'Item', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'pt', N'Item', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'pt', N'Jan', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'pt', N'Julho', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'pt', N'Junho', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'pt', N'Nível', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'pt', N'Março', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'pt', N'Maio', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'pt', N'Mês', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'pt', N'Nome', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'pt', N'Nov', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'pt', N'Out', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'pt', N'Seção', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'pt', N'Set', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'pt', N'Ordem de classificação', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'pt', N'Data de início', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'pt', N'Ano', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'pt', N'Contas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'pt', N'Livro caixa', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'pt', N'Livro caixa (código SQL)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'pt', N'Empresas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'pt', N'Item e Empresas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'pt', N'Itens', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'pt', N'Banco', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'pt', N'Saldo final', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'pt', N'Imposto de Renda', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'pt', N'Cliente C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'pt', N'Cliente C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'pt', N'Cliente C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'pt', N'Cliente C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'pt', N'Cliente C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'pt', N'Cliente C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'pt', N'Cliente C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'pt', N'Despesas', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'pt', N'Imposto de renda individual', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'pt', N'Mudança de rede', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'pt', N'Saldo inicial', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'pt', N'Folha de pagamento', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'pt', N'Impostos sobre os salários', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'pt', N'Receita', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'pt', N'Fornecedor S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'pt', N'Fornecedor S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'pt', N'Fornecedor S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'pt', N'Fornecedor S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'pt', N'Fornecedor S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'pt', N'Fornecedor S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'pt', N'Fornecedor S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'pt', N'Impostos', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'pt', N'Despesas totais', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'pt', N'Renda total', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'pt', N'Dinheiro por meses', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'pt', N'ID da empresa', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'pt', N'ID do item', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'pt', N'Traduções', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'pt', N'Detalhes', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'ru', N'Счет', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'ru', N'Счет', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'ru', N'Апр', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'ru', N'Авг', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'ru', N'Остаток', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'ru', N'Проверено', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'ru', N'Компания', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'ru', N'Компания', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'ru', N'Расходы', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'ru', N'Дата', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'ru', N'Число', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'ru', N'Доходы', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'ru', N'Дек', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'ru', N'Конечная дата', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'ru', N'Фев', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'ru', N'Id', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'ru', N'Статья', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'ru', N'Статья', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'ru', N'Янв', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'ru', N'Июл', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'ru', N'Июн', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'ru', N'Уровень', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'ru', N'Мар', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'ru', N'Май', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'ru', N'Месяц', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'ru', N'Наименование', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'ru', N'Ноя', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'ru', N'Окт', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'ru', N'Секция', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'ru', N'Сен', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'ru', N'Порядок', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'ru', N'Начальная дата', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'ru', N'Год', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'ru', N'Счета', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'ru', N'Кассовая книга', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'ru', N'Кассовая книга (SQL код)', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'ru', N'Компании', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'ru', N'Статьи и компании', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'ru', N'Статьи', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'ru', N'Банк', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'ru', N'Конечное сальдо', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'ru', N'Налог на прибыль', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'ru', N'Покупатель C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'ru', N'Покупатель C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'ru', N'Покупатель C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'ru', N'Покупатель C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'ru', N'Покупатель C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'ru', N'Покупатель C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'ru', N'Покупатель C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'ru', N'Расходы', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'ru', N'НДФЛ', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'ru', N'Изменение', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'ru', N'Начальное сальдо', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'ru', N'Заработная плата', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'ru', N'Страховые взносы', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'ru', N'Выручка', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'ru', N'Поставщик S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'ru', N'Поставщик S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'ru', N'Поставщик S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'ru', N'Поставщик S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'ru', N'Поставщик S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'ru', N'Поставщик S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'ru', N'Поставщик S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'ru', N'Налоги', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'ru', N'Всего выплаты', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'ru', N'Всего поступления', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'ru', N'ДДС по месяцам', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'ru', N'Id компании', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'ru', N'Id статьи', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'ru', N'Исходные данные', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'zh-hans', N'帐户', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'zh-hans', N'帐户', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'zh-hans', N'四月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'zh-hans', N'八月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'zh-hans', N'平衡', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'zh-hans', N'已检查', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'zh-hans', N'公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'zh-hans', N'公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'zh-hans', N'花费', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'zh-hans', N'日期', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'zh-hans', N'日', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'zh-hans', N'收入', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'zh-hans', N'十二月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'zh-hans', N'结束日期', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'zh-hans', N'二月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'zh-hans', N'ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'zh-hans', N'项', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'zh-hans', N'项', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'zh-hans', N'一月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'zh-hans', N'七月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'zh-hans', N'六月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'zh-hans', N'水平', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'zh-hans', N'三月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'zh-hans', N'五月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'zh-hans', N'月份', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'zh-hans', N'名称', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'zh-hans', N'十一月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'zh-hans', N'十月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'zh-hans', N'部分', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'zh-hans', N'九月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'zh-hans', N'排序顺序', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'zh-hans', N'开始日期', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'zh-hans', N'年', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'zh-hans', N'账户', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'zh-hans', N'现金簿', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'zh-hans', N'现金簿（SQL 代码）', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'zh-hans', N'公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'zh-hans', N'物品和公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'zh-hans', N'物品', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'zh-hans', N'银行', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'zh-hans', N'期末余额', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'zh-hans', N'公司所得税', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'zh-hans', N'顾客C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'zh-hans', N'顾客C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'zh-hans', N'顾客C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'zh-hans', N'顾客C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'zh-hans', N'顾客C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'zh-hans', N'顾客C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'zh-hans', N'顾客C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'zh-hans', N'花费', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'zh-hans', N'个人所得税', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'zh-hans', N'净变化', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'zh-hans', N'期初余额', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'zh-hans', N'工资单', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'zh-hans', N'工资税', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'zh-hans', N'营收', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'zh-hans', N'供应商 S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'zh-hans', N'供应商 S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'zh-hans', N'供应商 S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'zh-hans', N'供应商 S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'zh-hans', N'供应商 S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'zh-hans', N'供应商 S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'zh-hans', N'供应商 S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'zh-hans', N'税收', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'zh-hans', N'总费用', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'zh-hans', N'总收入', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'zh-hans', N'每月现金', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'zh-hans', N'公司 ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'zh-hans', N'项目 ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'zh-hans', N'翻译', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'zh-hans', N'详情', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account', N'zh-hant', N'帳戶', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'account_id', N'zh-hant', N'帳戶', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Apr', N'zh-hant', N'四月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Aug', N'zh-hant', N'八月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'balance', N'zh-hant', N'平衡', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'checked', N'zh-hant', N'已檢查', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company', N'zh-hant', N'公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'company_id', N'zh-hant', N'公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'credit', N'zh-hant', N'花費', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'date', N'zh-hant', N'日期', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'day', N'zh-hant', N'日', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'debit', N'zh-hant', N'收入', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Dec', N'zh-hant', N'十二月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'end_date', N'zh-hant', N'結束日期', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Feb', N'zh-hant', N'二月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'id', N'zh-hant', N'ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item', N'zh-hant', N'項', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'item_id', N'zh-hant', N'項', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jan', N'zh-hant', N'一月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jul', N'zh-hant', N'七月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Jun', N'zh-hant', N'六月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'level', N'zh-hant', N'水平', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Mar', N'zh-hant', N'三月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'May', N'zh-hant', N'五月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'month', N'zh-hant', N'月份', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Name', N'zh-hant', N'名稱', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Nov', N'zh-hant', N'十一月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Oct', N'zh-hant', N'十月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'section', N'zh-hant', N'部分', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'Sep', N'zh-hant', N'九月', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'sort_order', N'zh-hant', N'排序順序', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'start_date', N'zh-hant', N'開始日期', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, NULL, N'year', N'zh-hant', N'年', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'accounts', NULL, N'zh-hant', N'賬戶', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'cashbook', NULL, N'zh-hant', N'現金簿', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'code_cashbook', NULL, N'zh-hant', N'現金簿（SQL 代碼）', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'companies', NULL, N'zh-hant', N'公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'item_companies', NULL, N'zh-hant', N'物品和公司', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'items', NULL, N'zh-hant', N'物品', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Bank', N'zh-hant', N'銀行', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Closing Balance', N'zh-hant', N'期末餘額', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Corporate Income Tax', N'zh-hant', N'公司所得稅', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C1', N'zh-hant', N'顧客C1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C2', N'zh-hant', N'顧客C2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C3', N'zh-hant', N'顧客C3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C4', N'zh-hant', N'顧客C4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C5', N'zh-hant', N'顧客C5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C6', N'zh-hant', N'顧客C6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Customer C7', N'zh-hant', N'顧客C7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Expenses', N'zh-hant', N'花費', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Individual Income Tax', N'zh-hant', N'個人所得稅', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Net Change', N'zh-hant', N'淨變化', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Opening Balance', N'zh-hant', N'期初餘額', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll', N'zh-hant', N'工資單', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Payroll Taxes', N'zh-hant', N'工資稅', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Revenue', N'zh-hant', N'營收', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S1', N'zh-hant', N'供應商 S1', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S2', N'zh-hant', N'供應商 S2', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S3', N'zh-hant', N'供應商 S3', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S4', N'zh-hant', N'供應商 S4', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S5', N'zh-hant', N'供應商 S5', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S6', N'zh-hant', N'供應商 S6', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Supplier S7', N'zh-hant', N'供應商 S7', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Taxes', N'zh-hant', N'稅收', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Expenses', N'zh-hant', N'總費用', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'strings', N'Total Income', N'zh-hant', N'總收入', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', NULL, N'zh-hant', N'每月現金', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'company_id', N'zh-hant', N'公司 ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'usp_cash_by_months', N'item_id', N'zh-hant', N'項目 ID', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'translations', NULL, N'zh-hant', N'翻译', NULL, NULL);
INSERT INTO translations (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, LANGUAGE_NAME, TRANSLATED_NAME, TRANSLATED_DESC, TRANSLATED_COMMENT) VALUES (NULL, N'xl_details_cash_by_months', NULL, N'zh-hant', N'詳情', NULL, NULL);

INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'accounts', N'<table name="accounts"><columnFormats><column name="" property="ListObjectName" value="accounts" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="5" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="name" property="Address" value="$D$4" type="String"/><column name="name" property="ColumnWidth" value="27.86" type="Double"/><column name="name" property="NumberFormat" value="General" type="String"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/><column name="" property="PageSetup.PaperSize" value="1" type="Double"/></columnFormats></table>');
INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'items', N'<table name="items"><columnFormats><column name="" property="ListObjectName" value="items" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="5" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="name" property="Address" value="$D$4" type="String"/><column name="name" property="ColumnWidth" value="27.86" type="Double"/><column name="name" property="NumberFormat" value="General" type="String"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/><column name="" property="PageSetup.PaperSize" value="1" type="Double"/></columnFormats></table>');
INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'companies', N'<table name="companies"><columnFormats><column name="" property="ListObjectName" value="companies" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="5" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="name" property="Address" value="$D$4" type="String"/><column name="name" property="ColumnWidth" value="27.86" type="Double"/><column name="name" property="NumberFormat" value="General" type="String"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/><column name="" property="PageSetup.PaperSize" value="1" type="Double"/></columnFormats></table>');
INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'item_companies', N'<table name="item_companies"><columnFormats><column name="" property="ListObjectName" value="item_companies" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="Address" value="$C$4" type="String"/><column name="item_id" property="ColumnWidth" value="27.86" type="Double"/><column name="item_id" property="NumberFormat" value="General" type="String"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="Address" value="$D$4" type="String"/><column name="company_id" property="ColumnWidth" value="27.86" type="Double"/><column name="company_id" property="NumberFormat" value="General" type="String"/><column name="_State_" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="_State_" property="Address" value="$E$4" type="String"/><column name="_State_" property="ColumnWidth" value="9.14" type="Double"/><column name="_State_" property="NumberFormat" value="General" type="String"/><column name="_State_" property="HorizontalAlignment" value="-4108" type="Double"/><column name="_State_" property="Font.Size" value="10" type="Double"/><column name="_State_" property="FormatConditions(1).AppliesTo.Address" value="$E$4:$E$20" type="String"/><column name="_State_" property="FormatConditions(1).Type" value="6" type="Double"/><column name="_State_" property="FormatConditions(1).Priority" value="1" type="Double"/><column name="_State_" property="FormatConditions(1).ShowIconOnly" value="True" type="Boolean"/><column name="_State_" property="FormatConditions(1).IconSet.ID" value="8" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(1).Type" value="3" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(1).Operator" value="7" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(2).Type" value="0" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(2).Value" value="0.5" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(2).Operator" value="7" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(3).Type" value="0" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(3).Value" value="1" type="Double"/><column name="_State_" property="FormatConditions(1).IconCriteria(3).Operator" value="7" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'usp_cash_by_months', N'<table name="usp_cash_by_months"><columnFormats><column name="" property="ListObjectName" value="Sheet1_Table16" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="sort_order" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="sort_order" property="Address" value="$C$4" type="String"/><column name="sort_order" property="NumberFormat" value="General" type="String"/><column name="section" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="section" property="Address" value="$D$4" type="String"/><column name="section" property="NumberFormat" value="General" type="String"/><column name="level" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="level" property="Address" value="$E$4" type="String"/><column name="level" property="NumberFormat" value="General" type="String"/><column name="item_id" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="item_id" property="Address" value="$F$4" type="String"/><column name="item_id" property="NumberFormat" value="General" type="String"/><column name="company_id" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="company_id" property="Address" value="$G$4" type="String"/><column name="company_id" property="NumberFormat" value="General" type="String"/><column name="Name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Name" property="Address" value="$H$4" type="String"/><column name="Name" property="ColumnWidth" value="21.43" type="Double"/><column name="Name" property="NumberFormat" value="General" type="String"/><column name="Total" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Total" property="Address" value="$I$4" type="String"/><column name="Total" property="ColumnWidth" value="8.43" type="Double"/><column name="Total" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Jan" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jan" property="Address" value="$J$4" type="String"/><column name="Jan" property="ColumnWidth" value="10" type="Double"/><column name="Jan" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Feb" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Feb" property="Address" value="$K$4" type="String"/><column name="Feb" property="ColumnWidth" value="10" type="Double"/><column name="Feb" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Mar" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Mar" property="Address" value="$L$4" type="String"/><column name="Mar" property="ColumnWidth" value="10" type="Double"/><column name="Mar" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Apr" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Apr" property="Address" value="$M$4" type="String"/><column name="Apr" property="ColumnWidth" value="10" type="Double"/><column name="Apr" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="May" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="May" property="Address" value="$N$4" type="String"/><column name="May" property="ColumnWidth" value="10" type="Double"/><column name="May" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Jun" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jun" property="Address" value="$O$4" type="String"/><column name="Jun" property="ColumnWidth" value="10" type="Double"/><column name="Jun" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Jul" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jul" property="Address" value="$P$4" type="String"/><column name="Jul" property="ColumnWidth" value="10" type="Double"/><column name="Jul" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Aug" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Aug" property="Address" value="$Q$4" type="String"/><column name="Aug" property="ColumnWidth" value="10" type="Double"/><column name="Aug" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Sep" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Sep" property="Address" value="$R$4" type="String"/><column name="Sep" property="ColumnWidth" value="10" type="Double"/><column name="Sep" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Oct" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Oct" property="Address" value="$S$4" type="String"/><column name="Oct" property="ColumnWidth" value="10" type="Double"/><column name="Oct" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Nov" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Nov" property="Address" value="$T$4" type="String"/><column name="Nov" property="ColumnWidth" value="10" type="Double"/><column name="Nov" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="Dec" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Dec" property="Address" value="$U$4" type="String"/><column name="Dec" property="ColumnWidth" value="10" type="Double"/><column name="Dec" property="NumberFormat" value="#,##0;[Red]-#,##0;" type="String"/><column name="_RowNum" property="FormatConditions(1).AppliesToTable" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(1).AppliesTo.Address" value="$B$4:$U$20" type="String"/><column name="_RowNum" property="FormatConditions(1).Type" value="2" type="Double"/><column name="_RowNum" property="FormatConditions(1).Priority" value="3" type="Double"/><column name="_RowNum" property="FormatConditions(1).Formula1" value="=$E4&lt;2" type="String"/><column name="_RowNum" property="FormatConditions(1).Font.Bold" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(2).AppliesToTable" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(2).AppliesTo.Address" value="$B$4:$U$20" type="String"/><column name="_RowNum" property="FormatConditions(2).Type" value="2" type="Double"/><column name="_RowNum" property="FormatConditions(2).Priority" value="4" type="Double"/><column name="_RowNum" property="FormatConditions(2).Formula1" value="=AND($E4=0,$D4&gt;1,$D4&lt;5)" type="String"/><column name="_RowNum" property="FormatConditions(2).Font.Bold" value="True" type="Boolean"/><column name="_RowNum" property="FormatConditions(2).Font.Color" value="16777215" type="Double"/><column name="_RowNum" property="FormatConditions(2).Font.ThemeColor" value="1" type="Double"/><column name="_RowNum" property="FormatConditions(2).Font.TintAndShade" value="0" type="Double"/><column name="_RowNum" property="FormatConditions(2).Interior.Color" value="6773025" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All columns"><column name="" property="ListObjectName" value="cash_by_month" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="sort_order" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="section" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="level" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jan" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Feb" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Mar" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Apr" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="May" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jun" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jul" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Aug" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Sep" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Oct" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Nov" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Dec" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Default"><column name="" property="ListObjectName" value="cash_by_month" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="sort_order" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="section" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="level" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="Name" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jan" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Feb" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Mar" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Apr" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="May" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jun" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Jul" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Aug" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Sep" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Oct" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Nov" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="Dec" property="EntireColumn.Hidden" value="False" type="Boolean"/></view></views></table>');
INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'cashbook', N'<table name="cashbook"><columnFormats><column name="" property="ListObjectName" value="cashbook" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="Address" value="$E$4" type="String"/><column name="account_id" property="ColumnWidth" value="12.14" type="Double"/><column name="account_id" property="NumberFormat" value="General" type="String"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="Address" value="$F$4" type="String"/><column name="item_id" property="ColumnWidth" value="20.71" type="Double"/><column name="item_id" property="NumberFormat" value="General" type="String"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="Address" value="$G$4" type="String"/><column name="company_id" property="ColumnWidth" value="20.71" type="Double"/><column name="company_id" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');
INSERT INTO formats (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES (NULL, N'code_cashbook', N'<table name="code_cashbook"><columnFormats><column name="" property="ListObjectName" value="usp_cashbook" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium2" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="True" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="id" property="Address" value="$C$4" type="String"/><column name="id" property="ColumnWidth" value="4.29" type="Double"/><column name="id" property="NumberFormat" value="General" type="String"/><column name="id" property="Validation.Type" value="1" type="Double"/><column name="id" property="Validation.Operator" value="1" type="Double"/><column name="id" property="Validation.Formula1" value="-2147483648" type="String"/><column name="id" property="Validation.Formula2" value="2147483647" type="String"/><column name="id" property="Validation.AlertStyle" value="1" type="Double"/><column name="id" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="id" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="id" property="Validation.ShowInput" value="True" type="Boolean"/><column name="id" property="Validation.ShowError" value="True" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="Address" value="$D$4" type="String"/><column name="date" property="ColumnWidth" value="11.43" type="Double"/><column name="date" property="NumberFormat" value="m/d/yyyy" type="String"/><column name="date" property="Validation.Type" value="4" type="Double"/><column name="date" property="Validation.Operator" value="5" type="Double"/><column name="date" property="Validation.Formula1" value="12/31/1899" type="String"/><column name="date" property="Validation.AlertStyle" value="1" type="Double"/><column name="date" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="date" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="date" property="Validation.ShowInput" value="True" type="Boolean"/><column name="date" property="Validation.ShowError" value="True" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="Address" value="$E$4" type="String"/><column name="account_id" property="ColumnWidth" value="12.14" type="Double"/><column name="account_id" property="NumberFormat" value="General" type="String"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="Address" value="$F$4" type="String"/><column name="item_id" property="ColumnWidth" value="20.71" type="Double"/><column name="item_id" property="NumberFormat" value="General" type="String"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="Address" value="$G$4" type="String"/><column name="company_id" property="ColumnWidth" value="20.71" type="Double"/><column name="company_id" property="NumberFormat" value="General" type="String"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="Address" value="$H$4" type="String"/><column name="debit" property="ColumnWidth" value="11.43" type="Double"/><column name="debit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="debit" property="Validation.Type" value="2" type="Double"/><column name="debit" property="Validation.Operator" value="4" type="Double"/><column name="debit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="debit" property="Validation.AlertStyle" value="1" type="Double"/><column name="debit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="debit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="debit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="debit" property="Validation.ShowError" value="True" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="Address" value="$I$4" type="String"/><column name="credit" property="ColumnWidth" value="11.43" type="Double"/><column name="credit" property="NumberFormat" value="#,##0.00_ ;[Red]-#,##0.00 " type="String"/><column name="credit" property="Validation.Type" value="2" type="Double"/><column name="credit" property="Validation.Operator" value="4" type="Double"/><column name="credit" property="Validation.Formula1" value="-1.11222333444555E+29" type="String"/><column name="credit" property="Validation.AlertStyle" value="1" type="Double"/><column name="credit" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="credit" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="credit" property="Validation.ShowInput" value="True" type="Boolean"/><column name="credit" property="Validation.ShowError" value="True" type="Boolean"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats><views><view name="All rows"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/></view><view name="Incomes"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view><view name="Expenses"><column name="" property="ListObjectName" value="cash_book" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="date" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="account_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="item_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="company_id" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="debit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="credit" property="AutoFilter.Criteria1" value="&lt;&gt;" type="String"/></view></views></table>');

INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features (SaveToDB Framework).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3.xlsx',N'cashbook=cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":null,"item_id":null,"company_id":null},"ListObjectName":"cashbook"}
code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null},"ListObjectName":"code_cashbook"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months"}
objects=objects,(Default),False,$B$3,,{"Parameters":{"TABLE_NAME":null,"TABLE_TYPE":null},"ListObjectName":"objects"}
handlers=handlers,(Default),False,$B$3,,{"Parameters":{"EVENT_NAME":null,"HANDLER_TYPE":null},"ListObjectName":"handlers"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"LANGUAGE_NAME":"en"},"ListObjectName":"translations"}
workbooks=workbooks,(Default),False,$B$3,,{"Parameters":{},"ListObjectName":"workbooks"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-en.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"en"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"en"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"en"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"en"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Chinese Simplified).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-zh-hans.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"zh-hans"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"zh-hans"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"zh-hans"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"zh-hans"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Chinese Traditional).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-zh-hant.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"zh-hant"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"zh-hant"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"zh-hant"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"zh-hant"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, French).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-fr.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"fr"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"fr"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"fr"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"fr"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, German).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-de.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"de"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"de"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"de"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"de"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Italian).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-it.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"it"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"it"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"it"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"it"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Japanese).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-ja.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"ja"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"ja"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"ja"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"ja"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Korean).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-ko.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"ko"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"ko"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"ko"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"ko"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Portuguese).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-pt.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"pt"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"pt"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"pt"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"pt"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Russian).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-ru.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"ru"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"ru"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"ru"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"ru"}', NULL);
INSERT INTO workbooks (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES (N'Sample 02 - Advanced Features - User3 (Translation, Spanish).xlsx', N'https://www.savetodb.com/downloads/v10/sample02-user3-es.xlsx', N'code_cashbook=code_cashbook,(Default),False,$B$3,,{"Parameters":{"account_id":1,"item_id":null,"company_id":null,"start_date":null,"end_date":null,"checked":null},"ListObjectName":"code_cashbook","UseTranslatedName":true,"WorkbookLanguage":"es"}
cash_by_months=usp_cash_by_months,(Default),False,$B$3,,{"Parameters":{"year":2022},"ListObjectName":"cash_by_months","UseTranslatedName":true,"WorkbookLanguage":"es"}
translations=translations,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":"s02","LANGUAGE_NAME":"es"},"ListObjectName":"translations","UseTranslatedName":true,"WorkbookLanguage":"es"}', NULL);

-- print Application installed
