with
    orders as (
        select *
        from {{ source('northwind', 'orders') }}
        {% if env_var("DBT_TARGET_SCHEMA") == 'dev' %}
            limit 100
        {% endif %}
    )
select *
from orders