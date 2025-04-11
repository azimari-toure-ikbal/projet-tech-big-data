{{ config(materialized='view') }}

select
  VENTES_ID as ventes_id,
  VENTES_CODE as ventes_code,
  TO_DATE(VENTES_DATE_EDIT, 'YYYY-MM-DD') as date_edit,
  VENTES_FACTURES_ID as factures_id,
  VENTES_BOOKS_ID as books_id,
  VENTES_PU as pu,
  VENTES_QTE as qte,
  CREATED_AT as created_at
from {{ source('bookshop', 'VENTES') }}
