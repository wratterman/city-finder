Rails.application.routes.draw do
  get 'api/v1/crime_years/', to: "api/v1/crime_years#index", as: :crimes
  get 'api/v1/crime_years/:year', to: "api/v1/crime_years#show", as: :crime

  get 'api/v1/avg_weekly_reports/', to: "api/v1/states#index", as: :states
  get 'api/v1/avg_weekly_reports/:id', to: "api/v1/states#show", as: :state
end
