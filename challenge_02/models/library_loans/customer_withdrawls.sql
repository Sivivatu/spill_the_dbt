select 
    books.book_name,
    members.member_name,
    members.discount_applied,
    sum(loans.late_fee * members.discount_applied) as fee_applied
from {{ref('stg_members')}} as members
INNER JOIN {{ref('stg_loans')}} as loans on members.member_id = loans.member_id
LEFT JOIN {{ref('stg_books')}} as books on books.book_id = loans.book_id
GROUP BY all