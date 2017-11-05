Rails.application.routes.draw do
  # API
  get 'api/v1/crime_years/', to: "api/v1/crime_years#index", as: :crimes
  get 'api/v1/crime_years/:year', to: "api/v1/crime_years#show", as: :crime
  get 'api/v1/crime_states/', to: "api/v1/crime_states#index"
  get 'api/v1/crime_states/:state', to: "api/v1/crime_states#redirect_to_show"
  get 'api/v1/crime_states/:state/cities', to: "api/v1/crime_states#show"
  get 'api/v1/crime_states/:state/cities/:city_id', to: "api/v1/crime_states/crime_cities#show", as: :city
  get 'api/v1/most_dangerous_cities', to: "api/v1/most_dangerous_cities#index"
  get 'api/v1/crime_states/:state/most_dangerous_cities', to: "api/v1/crime_states/most_dangerous_cities#index"
  get 'api/v1/safest_cities', to: "api/v1/safest_cities#index"
  get 'api/v1/crime_states/:state/safest_cities', to: "api/v1/crime_states/safest_cities#index"
  get 'api/v1/avg_weekly_reports/', to: "api/v1/states#index", as: :states
  get 'api/v1/avg_weekly_reports/:id', to: "api/v1/states#show", as: :state
  get 'api/v1/:state_id/display_reports', to: "api/v1/states/display_reports#index"
  get 'api/v1/:state_id/display_cities', to: "api/v1/states/display_cities#index"

  # User

  get '/', to: 'welcome#index', as: :welcome
  get '/states', to: 'states#index', as: :view_states
  get '/states/:state', to: 'states#show', as: :view_state
  get '/states/:state_id/cities/:city_id', to: 'states/cities#show', as: :view_city
end
