{{
  config(
    materialized = 'table'
      )
}}
select * from
{{source('netfilxdb','dim_store')}}
