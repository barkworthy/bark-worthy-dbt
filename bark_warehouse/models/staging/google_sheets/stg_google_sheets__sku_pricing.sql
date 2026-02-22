select      internal_uuid,
            nullif(upper(trim(sku_id)),'') as sku_id,
            nullif(min_quantity,'')::smallint as min_quantity,
            nullif(max_quantity,'')::smallint as max_quantity,
            nullif(total_price,'')::smallint as total_price,
            nullif(lower(trim(price_type)),'') as price_type,
            nullif(start_date,'')::date as start_date,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_pricing') }}