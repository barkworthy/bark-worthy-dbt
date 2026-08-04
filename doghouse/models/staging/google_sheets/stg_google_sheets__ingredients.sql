select      internal_uuid,
            nullif(trim(supplier_name),'')          as supplier_name,
            nullif(lower(trim(ingredient_type)),'') as ingredient_type,
            nullif(lower(trim(ingredient_name)),'') as ingredient_name,
            nullif(upper(trim(ingredient_id)),'')   as ingredient_id,
            nullif(trim(lab_test_report),'')        as lab_test_report,
            nullif(trim(notes),'')                  as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'ingredients') }}