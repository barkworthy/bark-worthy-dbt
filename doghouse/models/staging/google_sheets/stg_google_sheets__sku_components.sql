{{ config(
    materialized='view',
    schema='staging'
) }}

select      internal_uuid,
            nullif(upper(trim(sku_id)),'')              as sku_id,
            nullif(upper(trim(component_code)),'')      as component_code,
            nullif(lower(trim(sku_category)),'')        as sku_category,
            nullif(trim(sku_description),'')            as sku_description,
            nullif(lower(trim(component_type)),'')      as component_type,
            nullif(lower(trim(packaging_type)),'')      as packaging_type,
            nullif(lower(trim(component_unit)),'')      as component_unit,
            nullif(trim(component_value),'')::smallint  as component_value,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}