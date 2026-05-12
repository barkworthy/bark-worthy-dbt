select 		order_id,
			supplier_paid_date,
			supplier_name,
			supplier_contact,
            original_order_currency as original_total_order_currency,
			array_agg(distinct purchase_name) as purchase_name,
			array_agg(distinct purchase_type) as purchase_type,
			(array_agg(distinct converted_order_cost_php))[1] as order_total_cost_php,
            sum(original_order_total_cost) as order_total_cost_original,
			array_agg(distinct notes) as notes
from 		{{ ref('stg_google_sheets__supplier_order_line_items') }}
group by 	1, 2, 3, 4, 5