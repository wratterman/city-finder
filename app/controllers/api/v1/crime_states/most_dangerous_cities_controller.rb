class Api::V1::CrimeStates::MostDangerousCitiesController < ApplicationController
  before_action :set_crime, only: [:index]

  def index
    state = State.find(params[:state])
    limit = params[:limit] || 20
    @cities = City.most_dangerous_cities_for(@crime, state.id, limit)
    formatted = {:id => state.id, :name => state.name, :most_dangerous_cities => @cities}
    render json: formatted
  end

  private

  def set_crime
    @crime = params[:crime] || "violent_crime"
  end
end
