select      order_id,
			order_source,
			order_timestamp,
			customer_name,
			cancel_date,
			sum(quantity) filter (where purchase_type = 'sku') 					as purchased_quantity,
			count(purchase_id) filter (where purchase_type = 'sku') 			as num_purchase_types,
			sum(net_revenue) filter (where purchase_type = 'sku') 				as total_net_revenue,
			coalesce(sum(quantity) filter (where purchase_type = 'freebie'),0)	as freebies_quantity,
			count(purchase_id) filter (where purchase_type = 'freebie') 		as num_freebie_types
from        {{ ref('fact_orders_line_items') }}
group by 	order_id,
			order_source,
			order_timestamp,
			customer_name,
			cancel_date