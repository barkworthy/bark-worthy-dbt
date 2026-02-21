{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            order_id::int,
            supplier_paid_date::date,
            trim(purchase_name) as purchase_name,
            lower(trim(purchase_type)) as purchase_type,
            order_quantity::smallint,
            lower(trim(order_unit)) as order_unit,
            unit_net_weight_g::smallint,
            original_order_total_cost::float,
            upper(trim(original_order_currency)) as original_order_currency,
            converted_order_cost_php::float,
            supplier_shipped_date::date,
            trim(supplier_name) as supplier_name,
            trim(supplier_contact) as supplier_contact,
            rejects::smallint,
            trim(notes) as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}