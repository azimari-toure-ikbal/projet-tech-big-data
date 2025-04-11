{{ config(materialized='view') }}

select
  CUSTOMERS_ID as customers_id,
  CUSTOMERS_CODE as customers_code,
  CUSTOMERS_FIRST_NAME as first_name,
  CUSTOMERS_LAST_NAME as last_name,
  CREATED_AT as created_at
from {{ source('bookshop', 'CUSTOMERS') }}
