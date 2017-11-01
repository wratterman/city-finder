class Api::V1::CrimeStates::SafestCitiesController < ApplicationController
  before_action :set_crime, only: [:index]

  def index
    state = State.find(params[:id])
    @cities = City.safest_cities_for(@crime, state.id)
    formatted = {:id => state.id, :name => state.name, :safest_cities => @cities}
    render json: formatted
  end

  private

  def set_crime
    @crime = params[:crime] || "violent_crime"
  end
end
