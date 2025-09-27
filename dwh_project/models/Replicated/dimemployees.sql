 {{
      config(
        materialized = 'table'
          )
    }}

select * from netfilxdb.gangadwh.dim_customer

