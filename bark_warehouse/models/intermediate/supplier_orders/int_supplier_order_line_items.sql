with

order_total as (
	select 	order_id,
			order_total_cost_php,
			order_total_cost_original
	from 	{{ ref('int_supplier_orders') }}
)

select 		o.order_id,
			o.purchase_name,
			o.order_quantity,
			o.order_unit,
			o.unit_net_weight_g,
			o.original_order_total_cost 								 as item_total_cost_original,
			o.original_order_currency									 as item_total_cost_original_currency,
			ot.order_total_cost_original,
			(o.original_order_total_cost / ot.order_total_cost_original)
				* order_total_cost_php 								     as item_total_cost_php,
			(o.original_order_total_cost / ot.order_total_cost_original)
				* order_total_cost_php / order_quantity 				 as item_unit_cost_php,
			ot.order_total_cost_php,
			o.rejects,
			o.notes
from 		{{ ref('stg_google_sheets__supplier_order_line_items') }} o
			left join order_total ot on o.order_id = ot.order_id