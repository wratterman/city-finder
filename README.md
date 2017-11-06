# CityFinder
Crime and Economic Data Visualization for National, States, and Cities

A brief description of your project, what it is used for and how does life get
awesome when someone starts to use it.

## Installing / Getting started

To get the app running....

```shell
git clone https://github.com/wratterman/city-finder.git
cd city_finder
bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
rails s
```

The app is separated out in a way that very little is being passed through the controllers
to the views directly, but rather being hit with internal api requests.

## Features

### Backend
#### Source Data
  - [Economics](https://www.bls.gov/ces/#tables)
  - [State Crime](https://ucr.fbi.gov/crime-in-the-u.s/2013/crime-in-the-u.s.-2013/tables/table-8/table_8_offenses_known_to_law_enforcement_by_state_by_city_2013.xls/view)
  - [National Crime over Time](https://ucr.fbi.gov/crime-in-the-u.s/2013/crime-in-the-u.s.-2013/tables/1tabledatadecoverviewpdf/table_1_crime_in_the_united_states_by_volume_and_rate_per_100000_inhabitants_1994-2013.xls)
#### Heroku URL (for Endpoints)
  https://spooky-werewolf-89206.herokuapp.com/
#### Endpoints
  
  - `api/v1/crime_years` Returns JSON of national crimes and crime rates from `1994-2013`. This does accept params   `api/v1/crime_years?year="YEAR_HERE"`, which will only return reports for years after and including the provided year
  - `api/v1/crime_years/:year` Return a JSON of a specific year. Additionally, All State Crime data is based on 2013, or the last crime year available. This endpoint is in effect 'National Average' for given year
  - `api/v1/most_dangerous_cities` Returns a JSON of 20 cities with the highest Violent Crime Rate, by default, with a population > 100000. Optional Params are `?crime="CRIME"$limit="LIMIT"` where crime can be `violent_crime, murder, rape, robbery, aggrevated_assault, property_crime, burglary, larceny_theft, motor_vehicle_theft`. This will sort the cities by the provided crime You can also control the amount of cities you get back from the url with limit.
  - `api/v1/safest_cities` Returns a JSON of 20 cities with the lowest Violent Crime Rate, by default, with a population > 100000. Optional Params are `?crime="CRIME"$limit="LIMIT"` where crime can be `violent_crime, murder, rape, robbery, aggrevated_assault, property_crime, burglary, larceny_theft, motor_vehicle_theft`. This will sort the cities by the provided crime You can also control the amount of cities you get back from the url with limit.
  - `api/v1/crime_states` Returns a JSON of all states will all their cities. Don't hit, too big.
  - `api/v1/crime_states/:state_id/cities` Returns a JSON of State with an array of all the cities that belong to that state.
  - `api/v1/crime_states/:state_id/cities/:city_id` Returns a JSON of a specific City
  - `api/v1/crime_states/:state_id/most_dangerous_cities` Same as above `api/v1/most_dangerous_cities`, but only for cities the belong to the provided state. Optional params included as well
  - `api/v1/crime_states/:state_id/safest_cities` Same as above `api/v1/safest_cities`, but only for cities the belong to the provided state. Optional params included as well
  - `api/v1/avg_weekly_reports` Econmonic Reports for all states, recorded in three increments at `Sept 2016, Aug 2017, Sept 2017`. The recorded information is average weekly hours worked, average hourly wages, average weekly earnings during that recording period.
  - `api/v1/avg_weekly_reports/:state_id` View Economic Reports only associated with the provided state
  - `api/v1/:state_id/display_reports` We don't want to display ALL cities associated with a state in the graphs in our front end, so a lot of times I controlled the amount of of JSONs we were getting back. Display reports quickly returns an array of economic reports for that state, and nothing else. Meant for graphing.
  - `api/v1/:state_id/display_cities` Cities associated with the provided state, ordered by population size with optional `?limit="DESIRED SIZE"`. I load 10 by default

### Frontend
 
 #### Graphing Libraries
  - [d3js](https://d3js.org/)
  - [dimplejs](https://dimplejs.org/)

