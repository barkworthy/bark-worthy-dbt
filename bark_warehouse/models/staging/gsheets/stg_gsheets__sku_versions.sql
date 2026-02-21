{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            created_date::date,
            upper(trim(sku_id)) as sku_id,
            trim(sku_description) as sku_description,
            price::smallint,
            trim(is_bundle)::boolean as is_bundle,
            lower(trim(category)) as category,
            weight::smallint,
            lower(trim(packaging)) as packaging,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}