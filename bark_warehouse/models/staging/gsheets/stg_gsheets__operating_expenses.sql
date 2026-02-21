{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            expense_id::int,
            purchase_date::date,
            lower(trim(purchase_name)) as purchase_name,
            price::float,
            quantity::smallint,
            trim(notes) as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'operating_expenses') }}