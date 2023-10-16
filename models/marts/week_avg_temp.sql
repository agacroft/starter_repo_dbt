WITH weekday_name AS (
    SELECT *
    FROM {{ref('prep_temp')}}
),
weekday_avg  AS (
    SELECT  --day_num,
            date_part('week', date) as week_number,
            AVG(maxtemp_c) AS avg_max_temp, 
            AVG(mintemp_c) AS avg_min_temp, 
            AVG(avgtemp_c) AS avg_temp
    FROM weekday_name
    GROUP BY date_part('week', date)

)
SELECT * 
FROM weekday_avg