select 		order_id,
			'direct' as order_source,
			ordered_timestamp,
			customer_name,
			purchase_id,
			purchase_type,
			quantity,
			paid_date,
			payment_method,
			price_at_purchase,
			price_adjustment_reason,
			price_at_purchase as gross_revenue,
			0 as voucher,
			0 as fees_and_charges,
			price_at_purchase as net_revenue,
			platform,
			channel,
			delivery_method,
			delivered_date,
			delivery_fee,
			delivery_address,
			cancelled_date,
			notes 
from 		{{ ref('stg_google_sheets__direct_sales') }}

union all 	

select 		order_id,
			'shopee' as order_source,
			ordered_date::timestamp as ordered_timestamp,
			customer_username as customer_name,
			purchase_id,
			purchase_type,
			quantity,
			ordered_date::timestamp as paid_date,
			null as payment_method,
			buyer_paid_amount as price_at_purchase,
			case
                when voucher is not null then 'voucher'
                else null
            end as price_adjustment_reason,
			gross_revenue,
			voucher,
			fees_and_charges,
			net_revenue,
			'shopee' as platform,
			null as channel,
			'courier' as delivery_method,
			ordered_date::timestamp as delivered_date,
			null as delivery_fee,
			null as delivery_address,
			null as cancelled_date,
			null as notes 
from 		{{ ref('stg_google_sheets__shopee_sales') }}

union all

select 		transaction_id as order_id,
			'event' as order_source,
			event_date::timestamp as ordered_timestamp,
			customer_name,
			purchase_id,
			purchase_type,
			quantity,
			event_date::timestamp as paid_date,
			payment_method,
			price as price_at_purchase,
			null as price_adjustment_reason,
			price as gross_revenue,
			null as voucher,
			null as fees_and_charges,
			price as net_revenue,
			'in_person' as platform,
			event_name as channel,
			'in_person' as delivery_method,
			event_date::timestamp as delivered_date,
			null as delivery_fee,
			null as delivery_address,
			null as cancelled_date,
			notes
from 		{{ ref('stg_google_sheets__event_transactions') }}
where 		transaction_type = 'sale'