Rails.application.routes.draw do
  get 'api/v1/crime_years/', to: "api/v1/crime_years#index", as: :crimes
  get 'api/v1/crime_years/:year', to: "api/v1/crime_years#show", as: :crime
  get 'api/v1/crime_states/', to: "api/v1/crime_states#index"
  get 'api/v1/crime_states/:id', to: "api/v1/crime_states#redirect_to_show"
  get 'api/v1/crime_states/:id/cities', to: "api/v1/crime_states#show"
  get 'api/v1/crime_states/:id/cities/:city_id', to: "api/v1/crime_states/crime_cities#show", as: :city
  get 'api/v1/most_dangerous_cities', to: "api/v1/most_dangerous_cities#index"
  get 'api/v1/crime_states/:state/most_dangerous_cities', to: "api/v1/crime_states/most_dangerous_cities#index"
  get 'api/v1/safest_cities', to: "api/v1/safest_cities#index"
  get 'api/v1/crime_states/:state/safest_cities', to: "api/v1/crime_states/safest_cities#index"
  get 'api/v1/avg_weekly_reports/', to: "api/v1/states#index", as: :states
  get 'api/v1/avg_weekly_reports/:id', to: "api/v1/states#show", as: :state

end
