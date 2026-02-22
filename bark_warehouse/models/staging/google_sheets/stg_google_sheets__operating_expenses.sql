select      internal_uuid,
            nullif(expense_id,'')::int              as expense_id,
            nullif(purchase_date,'')::date          as purchase_date,
            nullif(lower(trim(purchase_name)),'')   as purchase_name,
            nullif(price,'')::float                 as price,
            nullif(quantity,'')::smallint           as quantity,
            nullif(trim(notes),'')                  as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'operating_expenses') }}