{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            order_id::int,
            order_date::date,
            lower(trim(customer_username)) as customer_username,
            upper(trim(sku_id)) as sku_id,
            quantity::smallint,
            buyer_paid_amount::smallint,
            gross_revenue::smallint,
            voucher::float,
            fees_and_charges::float,
            net_income::float,
            processed_at::timestamp
from        {{ source('google_sheets', 'shopee_sales') }}