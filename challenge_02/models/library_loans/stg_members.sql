select 
    * ,
    discount_rate/100 as discount_applied
from {{ source('library', 'members')}}
    WHERE member_id IS NOT NULL
    AND membership_tier in ('Bronze', 'Silver', 'Gold' )