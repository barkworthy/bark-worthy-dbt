select      internal_uuid,
            nullif(trim(order_id),'')::int                  as order_id,
            nullif(trim(order_date),'')::date               as order_date,
            nullif(lower(trim(customer_username)),'')       as customer_username,
            nullif(upper(trim(sku_id)),'')                  as sku_id,
            nullif(trim(quantity),'')::smallint             as quantity,
            nullif(trim(buyer_paid_amount),'')::smallint    as buyer_paid_amount,
            nullif(trim(gross_revenue),'')::smallint        as gross_revenue,
            nullif(trim(voucher),'')::float                 as voucher,
            nullif(trim(fees_and_charges),'')::float        as fees_and_charges,
            nullif(trim(net_income),'')::float              as net_income,
            processed_at::timestamp
from        {{ source('google_sheets', 'shopee_sales') }}