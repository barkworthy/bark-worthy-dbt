
with 

valid_orders as (
	select 		order_id,
				order_source,
				delivered_date
	from 		{{ ref('int_orders') }}
	where 		is_valid_order
)

select 		o.order_id 		 as source_id,
			o.order_source 	 as item_source,
			l.purchase_id 	 as item_name,
			l.purchase_type  as item_type,
			l.quantity,
			o.delivered_date as movement_date
from 		valid_orders o 
			left join {{ ref('int_order_line_items') }} l on o.order_id = l.order_id and o.order_source = l.order_source

union all 

select 		movement_id as item_id,
			'inventory_movements' as item_source,
			item_name,
			item_type,
			abs(quantity_change) as quantity,
			movement_date
from 		{{ ref('stg_google_sheets__inventory_movement') }}

union all

select 		seeding_id as item_id,
			'creator_seedings' as item_source,
			product_id_sent as item_name,
			product_type as item_type,
			1 as quantity,
			delivered_date as movement_date
from 		{{ ref('stg_google_sheets__creator_seedings') }}
where 		delivered_date is not null