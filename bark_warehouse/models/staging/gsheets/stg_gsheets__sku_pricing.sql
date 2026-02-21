{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            upper(trim(sku_id)) as sku_id,
            min_quantity::smallint,
            max_quantity::smallint,
            total_price::smallint,
            lower(trim(price_type)) as price_type,
            start_date::date,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}