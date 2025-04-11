{{ config(materialized='table') }}

with sales as (
  select 
    books_id,
    to_char(date_edit, 'Day') as jour
  from {{ ref('stg_ventes') }}
)
select 
  jour,
  books_id,
  count(*) as ventes_count
from sales
group by jour, books_id
