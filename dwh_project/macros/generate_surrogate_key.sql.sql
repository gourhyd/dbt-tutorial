{% macro generate_surrogate_key(columns) %}
    -- This macro generates a surrogate key by hashing a list of columns
    -- Usage:
    --   {{ generate_surrogate_key(['col1','col2','col3']) }}

    {%- if columns is string %}
        {{ exceptions.raise_compiler_error("`columns` must be a list, not a string") }}
    {%- endif %}

    md5(
        {{ 
            columns | map('string') 
                    | map('trim') 
                    | map('lower') 
                    | join(" || '|' || ") 
        }}
    )
{% endmacro %}
