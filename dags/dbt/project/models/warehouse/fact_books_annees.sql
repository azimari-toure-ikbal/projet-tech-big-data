{{ config(materialized='table') }}

with sales as (
  select 
    books_id,
    EXTRACT(year from date_edit) as annee
  from {{ ref('stg_ventes') }}
)
select 
  annee,
  books_id,
  count(*) as ventes_count
from sales
group by annee, books_id
