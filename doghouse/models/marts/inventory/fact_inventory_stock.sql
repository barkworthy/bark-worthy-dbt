with

base as (
	select      item_name,
				item_type,
				movement_date,
				sum(quantity) as total_quantity_moved
	from        {{ ref('int_inventory_movements') }}
	group by 	1,2,3
),

add_movement_order as (
	select 		*,
				row_number() over (partition by item_name, item_type order by movement_date desc) as movement_order
	from 		base
)

select 		item_name,
			item_type,
			movement_date,
			total_quantity_moved,
			case
				when movement_order = 1 then true
				else false
			end as is_latest_movement,
			sum(total_quantity_moved) over (partition by item_name, item_type order by movement_order desc) as inventory_stock
from 		add_movement_order
