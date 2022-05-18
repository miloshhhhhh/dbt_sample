-- override the dbt_project.yml for the customers
{{
  config(
    materialized='view'
  )
}}

with costumers as (
    select id as customer_id, name as customer_name
    from customers
)