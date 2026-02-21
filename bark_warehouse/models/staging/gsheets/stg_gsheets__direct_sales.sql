{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            order_id::int,
            order_timestamp::timestamp,
            trim(customer_name) as customer_name,
            upper(trim(sku_id)) as sku_id,
            quantity::smallint,
            payment_date::date,
            lower(trim(payment_method)) as payment_method,
            price_at_purchase::int,
            lower(trim(price_adjustment_reason)) as price_adjustment_reason,
            lower(trim(platform)) as platform,
            lower(trim(delivery_method)) as delivery_method,
            delivery_date::date,
            delivery_fee::int,
            trim(delivery_address) as delivery_address,
            cancel_date::date,
            trim(notes) as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'direct_sales') }}