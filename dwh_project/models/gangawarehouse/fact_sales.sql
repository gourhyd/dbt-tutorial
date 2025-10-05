{{
    config(
    materialized = 'table'
    )
}}

with sales as
(
    SELECT SALES_ID,
    GROSS_AMOUNT,
    NET_AMOUNT,
    PAYMENT_METHOD,
    product_sk,
    customer_sk
    FROM {{source('netfilxdb','fact_sales')}}
),product as 
(
    select product_sk, category
    FROM {{source('netfilxdb','dim_product')}}

),
customer as
(
    select customer_sk,
    customer_code,
    gender
    FROM {{source('netfilxdb','dim_customer')}}
)
select 
--{{dbt_utils.generate_surrogate_key(['s.Sales_ID'])}} as Sales_SK,
s.Sales_ID,
s.product_sk,
s.Gross_Amount,
s.Net_Amount,
s.Payment_Method,
p.Category as Product_Category,
c.customer_code as Customer_Code
from sales s 
join product p using (product_sk)
join customer c using(customer_sk)
