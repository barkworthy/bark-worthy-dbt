select      internal_uuid,
            nullif(trim(movement_date),'')::date        as movement_date,
            nullif(trim(item_name),'')                  as item_name,
            nullif(trim(lower(item_source)),'')         as item_source,
            nullif(trim(quantity_change),'')::smallint  as quantity_change,
            nullif(lower(trim(movement_type)),'')       as movement_type,
            nullif(trim(notes),'')                      as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'inventory_movement') }}