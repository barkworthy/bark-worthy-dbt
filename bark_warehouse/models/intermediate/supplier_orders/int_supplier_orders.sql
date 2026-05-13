select 		order_id,
			supplier_paid_date,
			supplier_name,
			supplier_contact,
            original_order_currency			  as order_total_cost_original_currency,
			array_agg(distinct purchase_name) as purchase_name,
			array_agg(distinct purchase_type) as purchase_type,
			max(converted_order_cost_php) 	  as order_total_cost_php,
            max(original_order_total_cost) 	  as order_total_cost_original,
			array_agg(distinct notes)  		  as notes
from 		{{ ref('stg_google_sheets__supplier_order_line_items') }}
group by 	1, 2, 3, 4, 5