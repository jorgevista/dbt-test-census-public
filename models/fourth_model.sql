{{
    config(
        materialized='ephemeral'
    )
}}

SELECT TOP 4000
    ID AS USER_ID,
    SPLIT_PART(NAME, ' ', 1) AS FIRST_NAME,
    SPLIT_PART(NAME, ' ', 2) AS LAST_NAME,
    EMAIL AS EMAIL,
    DATEADD(DAY, 378, CREATED_AT) AS CREATED_AT
FROM DEVELOPMENT.DONNY.RAW_USER
ORDER BY  uniform(1, 6000, random()) DESC