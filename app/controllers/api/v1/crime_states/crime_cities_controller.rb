class Api::V1::CrimeStates::CrimeCitiesController < ApplicationController
  def show
    state = State.find_by(name: params[:state].downcase.capitalize)
    city_id  = params[:city_id]
    @city = state.cities.find(city_id)
    render json: @city
  end
end
