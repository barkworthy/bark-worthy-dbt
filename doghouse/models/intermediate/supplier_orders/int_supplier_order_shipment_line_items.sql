with 

shipping_total as (
	select 		shipment_id,
				order_id,
				shipping_cost_php,
				total_units_received
	from 		{{ ref ('int_supplier_order_shipments') }}
)

select 		o.shipment_id, 
			o.order_id,
			o.purchase_name,
			o.purchase_type,
			o.units_received,
			(o.units_received::real / s.total_units_received::real)
                * s.shipping_cost_php                               as total_item_shipping_cost,
			(o.units_received::real / s.total_units_received::real)
                * s.shipping_cost_php / units_received              as unit_shipping_cost
from 		public_staging.stg_google_sheets__supplier_order_shipments o
			left join shipping_total s on s.shipment_id = o.shipment_id 
				and s.order_id = o.order_id