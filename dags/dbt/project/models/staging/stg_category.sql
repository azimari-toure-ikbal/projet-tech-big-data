{{ config(materialized='view') }}

select
  CATEGORY_ID as category_id,
  CATEGORY_INTITULE as category_intitule,
  CREATED_AT as created_at
from {{ source('bookshop', 'CATEGORY') }}
