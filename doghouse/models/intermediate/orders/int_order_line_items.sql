select 		order_id,
			order_source,
			purchase_id,
			purchase_type,
			quantity
from 		{{ ref('int_order_line_items_unified_raw') }}