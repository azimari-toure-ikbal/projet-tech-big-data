{{ config(materialized='table') }}

with sales as (
  select 
    books_id,
    to_char(date_edit, 'Month') as mois
  from {{ ref('stg_ventes') }}
)
select 
  mois,
  books_id,
  count(*) as ventes_count
from sales
group by mois, books_id
