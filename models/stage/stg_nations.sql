WITH NATION AS (
    SELECT 
      N_NATIONKEY AS NATION_ID,
      N_REGIONKEY AS REGION_ID,
      N_NAME AS NAME, 
      N_COMMENT AS COMMENT,
      UPDATED_TS

FROM {{ source('src','nation')}}
)

SELECT * from nation