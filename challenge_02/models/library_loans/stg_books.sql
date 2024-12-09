select *,
        'Fact' as book_type
    from {{ source('library', 'books_factual')}}
    WHERE book_id IS NOT NULL
union 
select *,
        'Fiction' as book_type
    from {{source('library', 'books_fictional')}}
    WHERE book_id IS NOT NULL
