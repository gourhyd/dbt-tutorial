{{
    config(
    materialized = 'table'
    )
}}
SELECT 
 P.PRODUCT_SK
,P.PRODUCT_CODE
,P.PRODUCT_NAME
,P.CATEGORY
,P.DEPARTMENT
,S.QUANTITY
,S.UNIT_PRICE
,C.FIRST_NAME || ' ' || c.last_name AS CUSTOMER_NAME
FROM {{source('netfilxdb','dim_product')}} P
JOIN {{source('netfilxdb','fact_sales')}} S using (PRODUCT_SK)
JOIN {{source('netfilxdb','dim_customer')}} C using (CUSTOMER_SK)