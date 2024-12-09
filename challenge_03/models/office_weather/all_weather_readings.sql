{{ config(
    materialized= 'incremental',
    unique_key= ['office','time']
)}}

select * 
from {{ ref('extract_weather_data') }}
{% if is_incremental() %}
    WHERE time >= (select max(time) from {{ this }})
{% endif %}