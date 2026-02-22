select      internal_uuid,
            nullif(trim(order_id),'')::int          as order_id,
            nullif(lower(trim(order_source)),'')    as order_source,
            nullif(lower(trim(freebie_name)),'')    as freebie_name,
            nullif(trim(quantity),'')::smallint     as quantity,
            processed_at::timestamp
from        {{ source('google_sheets', 'order_freebies') }}