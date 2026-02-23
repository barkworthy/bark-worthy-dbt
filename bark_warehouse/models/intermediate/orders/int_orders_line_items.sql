select 		order_id, 
			'shopee' as order_source,
			order_date, 
			customer_username as customer_name,
			purchase_id,
			purchase_type,
			quantity,
			net_revenue,
			null as cancel_date
from 		{{ ref('stg_google_sheets__shopee_sales') }}

union all 

select 		order_id,
			'direct' as order_source,
			order_timestamp::date as order_date,
			customer_name,
			purchase_id,
			purchase_type,
			quantity,
			price_at_purchase as net_revenue,
			cancel_date
from 		{{ ref('stg_google_sheets__direct_sales') }}