{{ config(materialized='table') }}

select
  ventes_id,
  ventes_code,
  date_edit,
  EXTRACT(year from date_edit) as annee,
  to_char(date_edit, 'Month') as mois,
  to_char(date_edit, 'Day') as jour,
  books_id,
  pu,
  qte,
  created_at
from {{ ref('stg_ventes') }}
