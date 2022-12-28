{{
    config(
        materialized='ephemeral'
    )
}}


WITH dummy_emails AS (
    SELECT 
        RIGHT(HASH(seq4()), 10) AS user_id, 
        'dummy_' || seq4() || '@gmail.com' AS email 
    from table(generator(rowcount => 10000)) v 
    order by seq4()
),
dummy_audiences AS (
    SELECT
        'audience_' || seq4() AS audience_name
    from table(generator(rowcount => 5)) v 
    order by seq4()
)
select dummy_audiences.*, dummy_emails.*
from dummy_emails cross join dummy_audiences
order by dummy_audiences.audience_name asc;
