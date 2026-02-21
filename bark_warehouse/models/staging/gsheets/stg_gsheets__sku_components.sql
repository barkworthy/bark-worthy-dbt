{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            upper(trim(parent_sku_id)) as parent_sku_id,
            lower(trim(component_code)) as component_code,
            lower(trim(component_type)) as component_type,
            lower(trim(component_unit)) as component_unit,
            component_value::smallint,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}