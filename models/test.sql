select * from
{{ source('demo_source', 'bike') }} --this jinja code it the code that connects to the source
limit 10

-- this code was to test our source 