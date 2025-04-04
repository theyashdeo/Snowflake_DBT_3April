{{config(materialized='incremental')}}
WITH NATION AS (
    SELECT 
      NATION_ID,
      REGION_ID,
      NAME, 
      COMMENT,
      UPDATED_TS
FROM {{ref('stg_nations')}}
{%if is_incremental()%}
WHERE UPDATED_TS > (SELECT MAX(UPDATED_TS) FROM {{this}})
{%endif%}
)
-- The 'this' command ensures that we are referring to the same table. 
-- UPDATED_TS>MAX(UPDATED_TS) is used to ensure that duplicate values are not inserted when this is queried again
SELECT * from nation
-- Incremental makes sure the table is not created over and over again. 