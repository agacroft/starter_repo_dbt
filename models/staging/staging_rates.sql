with extracted_rates as (
    select 
        ((extracted_data -> 'date')::VARCHAR)::DATE as timestamp,
        (extracted_data -> 'base')::VARCHAR as base_currency,
        ((extracted_data -> 'rates' -> 'GBP')::VARCHAR)::FLOAT as gbp,
        ((extracted_data -> 'rates' -> 'USD')::VARCHAR)::FLOAT as usd,
        ((extracted_data -> 'rates' -> 'INR')::VARCHAR)::FLOAT as inr
    from {{source("staging", "rates_raw")}}
) 
select * 
from extracted_rates