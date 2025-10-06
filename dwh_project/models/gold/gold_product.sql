-- select * from netfilxdb.gangadwh.dim_product

{{ config(
   materialized = 'table'
) }}

{{ audit_helper.compare_all_columns (
   a_relation = ref('bronze_cust'),
   b_relation = ref('bronze_customer'),
   primary_key = "CUSTOMER_SK"
) }}
