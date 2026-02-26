with 

base as (
	select 		customer_name,
				order_source as source, 
				count(distinct order_id) filter (where cancel_date is null) as lifetime_num_orders,
				sum(total_net_revenue) filter (where cancel_date is null) as lifetime_revenue,
				min(order_timestamp) filter (where cancel_date is null) as first_order_timestamp,
				max(order_timestamp) filter (where cancel_date is null) as last_order_timestamp
	from 		{{ ref('fact_orders') }}
	where 		cancel_date is null
                and payment_date is not null
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