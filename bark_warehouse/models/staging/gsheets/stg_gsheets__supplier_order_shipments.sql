{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            shipment_id::int,
            order_id::int,
            trim(purchase_name) as purchase_name,
            lower(trim(purchase_type)) as purchase_type,
            num_boxes::smallint,
            units_received as int,
            trim(intl_forwarder_paid_date) as intl_forwarder_paid_date,
            trim(intl_forwarder_company) as intl_forwarder_company,
            trim(intl_forwarder_contact) as intl_forwarder_contact,
            lower(trim(freight_type)) as freight_type,
            shipping_cost_php::int,
            delivered_date::date,
            trim(notes) as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'sku_components') }}