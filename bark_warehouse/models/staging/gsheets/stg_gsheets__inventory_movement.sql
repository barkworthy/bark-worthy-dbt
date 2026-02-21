{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            movement_date::date,
            trim(item_name) as item_name,
            quantity_change::smallint,
            lower(trim(movement_type)) as movement_type,
            trim(notes) as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'inventory_movement') }}