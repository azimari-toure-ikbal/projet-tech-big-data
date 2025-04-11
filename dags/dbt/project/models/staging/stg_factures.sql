{{ config(materialized='view') }}

select
  FACTURES_ID as factures_id,
  FACTURES_CODE as factures_code,
  TO_DATE(FACTURES_DATE_EDIT, 'YYYY-MM-DD') as date_edit,
  FACTURES_CUSTOMERS_ID as customers_id,
  FACTURES_QTE_TOTALE as qte_totale,
  FACTURES_TOTAL_AMOUNT as total_amount,
  FACTURES_TOTAL_PAID as total_paid,
  CREATED_AT as created_at
from {{ source('bookshop', 'FACTURES') }}
