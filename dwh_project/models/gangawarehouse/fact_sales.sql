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
    FROM {{ ref('bronze_factsales') }}
),product as 
(
    select product_sk, category
    FROM {{ ref('bronze_product') }}

),
customer as
(
    select customer_sk,
    customer_code,
    gender
    FROM {{ ref('bronze_customer') }}
)
select 
--{{dbt_utils.generate_surrogate_key(['Sales_ID'])}} as Sales_SK
s.Sales_ID,
s.Gross_Amount,
s.Net_Amount,
s.Payment_Method,
p.Category as Product_Category,
c.customer_code as Customer_Code
from sales s 
join product p on p.product_sk= s.product_sk
join customer c on c.customer_sk=s.customer_sk
