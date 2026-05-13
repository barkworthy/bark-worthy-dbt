select 		shipment_id,
			order_id,
			intl_forwarder_paid_date,
			intl_forwarder_company,
			intl_forwarder_contact,
			freight_type,
			delivered_date,
			max(shipping_cost_php)            as shipping_cost_php,
			array_agg(distinct purchase_name) as purchase_name,
			array_agg(distinct purchase_type) as purchase_type,
			array_agg(distinct notes)         as notes
from 		{{ ref('stg_google_sheets__supplier_order_shipments') }}
group by 	1, 2, 3, 4, 5, 6, 7