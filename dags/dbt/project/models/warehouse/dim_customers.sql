{{ config(materialized='table') }}

select
  customers_id,
  customers_code,
  first_name,
  last_name,
  first_name || ' ' || last_name as nom,
  created_at
from {{ ref('stg_customers') }}
