{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            order_id::int,
            lower(trim(order_source)) as order_source,
            lower(trim(freebie_name)) as freebie_name,
            quantity::smallint,
            processed_at::timestamp
from        {{ source('google_sheets', 'order_freebies') }}