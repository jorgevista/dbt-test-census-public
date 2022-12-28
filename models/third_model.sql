{{
    config(
        materialized='table'
    )
}}

select
    'test_abc@example.com' as email,
    'Audience_A' as audience
union
select
    'test_defgh@example.com' as email,
    'Audience_A' as audience
