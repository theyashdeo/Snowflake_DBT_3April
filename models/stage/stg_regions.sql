WITH REGION AS (
    SELECT 
      R_REGIONKEY AS REGION_ID,
      R_NAME,
      R_COMMENT AS COMMENT

FROM {{ source('src','region')}}
)

SELECT * from REGION 

