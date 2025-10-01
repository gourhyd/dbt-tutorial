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
s.SALES_ID,
s.GROSS_AMOUNT,
s.NET_AMOUNT,
s.PAYMENT_METHOD,
p.category,
c.customer_code
from sales s 
join product p on p.product_sk= s.product_sk
join customer c on c.customer_sk=s.customer_sk
