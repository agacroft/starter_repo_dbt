with extracted_rates as (
    select *,
        to_char(timestamp, 'Day') as weekday
    from {{ref("staging_rates")}}
)
select * 
from extracted_rates