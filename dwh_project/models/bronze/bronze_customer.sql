{{
    config(
    materialized = 'incremental',
    unique_key = 'customer_sk'
    )
}}

select * from
{{source('netfilxdb','dim_customer')}}


{% if is_incremental() %}
  where customer_sk > (select max(customer_sk) from {{this}})
{% endif %}
