Rails.application.routes.draw do
  get 'crime_years/', to: "crime_years#index", as: :crimes
  get 'crime_years/:id', to: "crime_years#show", as: :crime

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
