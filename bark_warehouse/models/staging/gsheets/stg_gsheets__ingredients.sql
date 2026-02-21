{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(supplier_name) as supplier_name,
            lower(trim(ingredient_type)) as ingredient_type,
            lower(trim(ingredient_name)) as ingredient_name,
            upper(trim(ingredient_id)) as ingredient_id,
            trim(lab_test_report) as lab_test_report,
            trim(notes) as notes,
            trim(internal_uuid) as internal_uuid,
            processed_at::timestamp
from        {{ source('google_sheets', 'ingredients') }}