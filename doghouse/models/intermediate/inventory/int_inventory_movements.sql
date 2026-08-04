with 

movements_combined as (
	select 		source_id,
				item_source,
				item_name,
				item_type,
                'out' as movement_direction,
				-quantity as quantity,
				movement_date
	from 		{{ ref('int_inventory_out') }}
	
	union all 
	
	select 		source_id,
				item_source,
				item_name,
				item_type,
                'in' as movement_direction,
				quantity,
				movement_date
	from 		{{ ref('int_inventory_in') }}
)

select 		*
from 		movements_combined