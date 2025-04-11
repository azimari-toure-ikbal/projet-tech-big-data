{{ config(materialized='view') }}

select
  BOOKS_ID as books_id,
  BOOKS_CATEGORY_ID as category_id,
  BOOKS_CODE as books_code,
  BOOKS_INTITULE as books_intitule,
  BOOKS_ISBN_10 as isbn_10,
  BOOKS_ISBN_13 as isbn_13,
  CREATED_AT as created_at
from {{ source('bookshop', 'BOOKS') }}
