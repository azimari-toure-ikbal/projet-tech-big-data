{{ config(materialized='table') }}

select
  books_id,
  books_code,
  books_intitule,
  isbn_10,
  isbn_13,
  category_id,
  created_at
from {{ ref('stg_books') }}
