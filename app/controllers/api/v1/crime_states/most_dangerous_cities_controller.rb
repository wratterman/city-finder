class Api::V1::CrimeStates::MostDangerousCitiesController < ApplicationController
  before_action :set_crime, only: [:index]

  def index
    state = State.find_by(name: params[:state].downcase.capitalize)
    @cities = City.most_dangerous_cities_for(@crime, state.id)
    formatted = {:id => state.id, :name => state.name, :most_dangerous_cities => @cities}
    render json: formatted
  end

  private

  def set_crime
    @crime = params[:crime] || "violent_crime"
  end
end
