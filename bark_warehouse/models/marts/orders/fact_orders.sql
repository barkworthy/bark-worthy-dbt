with

base as (
	select      order_id,
				order_source,
				order_timestamp,
				payment_date,
				customer_name,
				cancel_date,
				case
					when payment_date is not null and cancel_date is null then TRUE
					else FALSE
				end as is_valid_order,
				sum(quantity) filter (where purchase_type = 'sku') 					as purchased_quantity,
				count(purchase_id) filter (where purchase_type = 'sku') 			as num_purchase_types,
				sum(net_revenue) filter (where purchase_type = 'sku') 				as total_net_revenue,
				coalesce(sum(quantity) filter (where purchase_type = 'freebie'),0)	as freebies_quantity,
				count(purchase_id) filter (where purchase_type = 'freebie') 		as num_freebie_types
	from        {{ ref('fact_orders_line_items') }}
	group by 	order_id,
				order_source,
				order_timestamp,
				payment_date,
				customer_name,
				cancel_date
),

is_new_order as (
	select 		order_id,
				order_source,
				customer_name,
				case
					when row_number() over (partition by order_source, customer_name order by order_id) = 1 then TRUE
					else FALSE
				end as is_new_order
	from 		base
	where 		is_valid_order
)

select 		b.*,
			n.is_new_order
from 		base b
			left join is_new_order n on b.order_id = n.order_id and n.order_source = b.order_source