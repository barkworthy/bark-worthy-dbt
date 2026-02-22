select      internal_uuid,
            nullif(created_date,'')::date as created_date,
            nullif(upper(trim(sku_id)),'') as sku_id,
            nullif(trim(sku_description),'') as sku_description,
            nullif(price,'')::smallint as price,
            nullif(trim(is_bundle),'')::boolean as is_bundle,
            nullif(lower(trim(category)),'') as category,
            nullif(weight,'')::smallint as weight,
            nullif(lower(trim(packaging)),'') as packaging,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_versions') }}