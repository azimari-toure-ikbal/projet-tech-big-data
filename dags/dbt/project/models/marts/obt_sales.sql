{{ config(materialized='table') }}

with ventes as (
  select * from {{ ref('fact_ventes') }}
),
factures as (
  select * from {{ ref('fact_factures') }}
),
dimcust as (
  select * from {{ ref('dim_customers') }}
),
dimcat as (
  select * from {{ ref('dim_category') }}
),
dimbks as (
  select * from {{ ref('dim_books') }}
)

select 
  v.ventes_id as vente_id,
  v.ventes_code,
  v.annee,
  v.mois,
  v.jour,
  v.pu,
  v.qte,
  f.factures_code,
  f.qte_totale,
  f.total_amount,
  f.total_paid,
  -- Informations provenant des dimensions
  dimcat.category_intitule,
  dimbks.books_code,
  dimbks.books_intitule,
  dimbks.isbn_10,
  dimbks.isbn_13,
  dimcust.customers_code,
  dimcust.nom as customer_nom
from ventes v
left join factures f on v.ventes_id = f.factures_id
left join dimbks on v.books_id = dimbks.books_id
left join dimcat on dimbks.category_id = dimcat.category_id
left join dimcust on f.customers_id = dimcust.customers_id
