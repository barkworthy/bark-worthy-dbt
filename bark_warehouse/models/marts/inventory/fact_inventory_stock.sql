select      *,
            sum(quantity) over (partition by item_name, item_type
                order by movement_date, item_source, source_id) as inventory_stock
from        {{ ref('int_inventory_movement') }}