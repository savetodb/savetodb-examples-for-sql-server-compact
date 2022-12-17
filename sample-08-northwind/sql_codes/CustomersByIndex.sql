SELECT
    *
FROM
    Customers c
WHERE
    SUBSTRING([Company Name], 1, 1) = @Index
