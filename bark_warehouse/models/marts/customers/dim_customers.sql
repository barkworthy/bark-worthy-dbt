with 

base as (
	select 		customer_name,
				order_source as source, 
				count(distinct order_id) as lifetime_num_orders,
				sum(total_net_revenue) as lifetime_revenue,
				min(ordered_timestamp) as first_order_timestamp,
				max(ordered_timestamp) as last_order_timestamp
	from 		{{ ref('fact_orders') }}
	where 		is_valid_order
	group by 	1,2
),

customer_key as (
    select 		{{ dbt_utils.generate_surrogate_key(['source','customer_name']) }} as customer_id,
                customer_name,
                source
    from 		base
)

select      c.customer_id,
			b.*
from        base b
            left join customer_key c on b.customer_name = c.customer_name and b.source = c.source