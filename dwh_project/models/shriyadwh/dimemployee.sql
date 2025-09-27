{{
    config(
        {
            "materialized": "table",
        }
    )
}}
select * from
{{source('shriyadwh','dimemployee')}}