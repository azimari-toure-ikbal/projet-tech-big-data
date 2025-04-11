{{ config(materialized='table') }}

select
  factures_id,
  factures_code,
  date_edit,
  EXTRACT(year from date_edit) as annee,
  to_char(date_edit, 'Month') as mois,
  to_char(date_edit, 'Day') as jour,
  customers_id,
  qte_totale,
  total_amount,
  total_paid,
  created_at
from {{ ref('stg_factures') }}
