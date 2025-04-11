{{ config(materialized='table') }}

select
  category_id,
  category_intitule,
  created_at
from {{ ref('stg_category') }}
