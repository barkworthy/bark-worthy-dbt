select      internal_uuid,
            nullif(order_id,'')::int as order_id,
            nullif(order_date,'')::date as order_date,
            nullif(lower(trim(customer_username)),'') as customer_username,
            nullif(upper(trim(sku_id)),'') as sku_id,
            nullif(quantity,'')::smallint as quantity,
            nullif(buyer_paid_amount,'')::smallint as buyer_paid_amount,
            nullif(gross_revenue,'')::smallint as gross_revenue,
            nullif(voucher,'')::float as voucher,
            nullif(fees_and_charges,'')::float as fees_and_charges,
            nullif(net_income,'')::float as net_income,
            processed_at::timestamp
from        {{ source('google_sheets', 'shopee_sales') }}