select 		order_id,
			'shopee' as order_source,
			ordered_date::timestamp as ordered_timestamp,
			ordered_date as paid_date,
			customer_username as customer_name,
			purchase_id,
			purchase_type,
			quantity,
			net_revenue,
			null as cancelled_date
from 		{{ ref('stg_google_sheets__shopee_sales') }}

union all

select 		order_id,
			'direct' as order_source,
			ordered_timestamp,
			paid_date,
			customer_name,
			purchase_id,
			purchase_type,
			quantity,
			price_at_purchase as net_revenue,
			cancelled_date
from 		{{ ref('stg_google_sheets__direct_sales') }}