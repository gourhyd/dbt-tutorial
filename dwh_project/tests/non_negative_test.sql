SELECT * 
FROM {{ ref('bronze_factsales') }}
WHERE gross_amount < 0 and net_amount < 0