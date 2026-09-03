WITH TRIPS as (

select
RIDE_ID,
RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE, -- we are converting to timestamp because we ingested our data as varchar
START_STATION_ID,
END_STATION_ID,
MEMBER_CASUAL,
TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS -- this code right here is to get the trip duration
                                                                                                --we couldve used the (-) arithmetic buiit that wont work in dbt cloud
                                                                                                -- so we used a snowflake function called timestampdiff

from {{ source('demo_source', 'bike') }}

where RIDE_ID != 'ride_id'

)

select
*
from TRIPS
