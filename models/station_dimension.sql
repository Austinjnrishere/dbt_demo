WITH BIKE as (

select
distinct
START_STATION_ID as station_id,
start_station_name as station_name,
START_LAT as station_lat,
START_LONG as station_lng

from {{ source('demo_source','bike') }}

where RIDE_ID != 'ride_id'

)

select
*
from BIKE