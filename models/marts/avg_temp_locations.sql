WITH weekday_name AS (
    SELECT *
    FROM {{ref('prep_temp')}}
),
weekday_avg  AS (
    SELECT  city,
            country,
            date,
            lat,
            lon,
            region,
            AVG(maxtemp_c) AS avg_max_temp, 
            AVG(mintemp_c) AS avg_min_temp, 
            AVG(avgtemp_c) AS avg_temp
    FROM weekday_name
    GROUP BY city, country, date, lat, lon, region
)
SELECT * 
FROM weekday_avg