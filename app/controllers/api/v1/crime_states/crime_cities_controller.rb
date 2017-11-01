class Api::V1::CrimeStates::CrimeCitiesController < ApplicationController
  def show
    state_id = params[:id]
    city_id  = params[:city_id]
    @city = State.find(state_id).cities.find(city_id)
    render json: @city
  end
end
