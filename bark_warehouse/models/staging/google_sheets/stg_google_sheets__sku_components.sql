{{ config(
    materialized='view',
    schema='staging'
) }}

select      internal_uuid,
            nullif(upper(trim(parent_sku_id)),'')       as parent_sku_id,
            nullif(upper(trim(component_code)),'')      as component_code,
            nullif(lower(trim(component_type)),'')      as component_type,
            nullif(lower(trim(component_unit)),'')      as component_unit,
            nullif(trim(component_value),'')::smallint  as component_value,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}