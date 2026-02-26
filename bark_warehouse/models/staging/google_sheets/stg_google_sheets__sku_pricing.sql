select      internal_uuid,
            nullif(upper(trim(sku_id)),'')          as sku_id,
            nullif(trim(min_quantity),'')::smallint as min_quantity,
            nullif(trim(max_quantity),'')::smallint as max_quantity,
            nullif(trim(total_price),'')::smallint  as total_price,
            nullif(lower(trim(price_type)),'')      as price_type,
            nullif(trim(effective_from),'')::date   as effective_from,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_pricing') }}