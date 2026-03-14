with 

delivered_shipments as (
	select 		order_id as source_id,
				'supplier_order' as item_source,
				purchase_name as item_name,
				purchase_type as item_type,
				units_received as quantity,
				delivered_date as movement_date
	from 		{{ ref('stg_google_sheets__supplier_order_shipments') }}
	where 		purchase_type = 'sku'
				and delivered_date is not null
),

non_sku_orders as (
	select 		expense_id as source_id, 
				'non_sku_purchase' as item_source,
				purchase_name as item_name, 
				purchase_type as item_type,
				quantity,
				delivered_date as movement_date
	from 		{{ ref('stg_google_sheets__non_sku_purchases') }}
	where 		quantity > 0
				and delivered_date is not null
				and purchase_type in ('freebie', 'packaging')
)

select 		*
from 		delivered_shipments

union all 

select 		*
from 		non_sku_orders