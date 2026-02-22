select      internal_uuid,
            nullif(trim(expense_id),'')::int        as expense_id,
            nullif(trim(purchase_date),'')::date    as purchase_date,
            nullif(lower(trim(purchase_name)),'')   as purchase_name,
            nullif(trim(price),'')::float           as price,
            nullif(trim(quantity),'')::smallint     as quantity,
            nullif(trim(notes),'')                  as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'operating_expenses') }}