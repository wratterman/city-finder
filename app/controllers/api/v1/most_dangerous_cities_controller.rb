class Api::V1::MostDangerousCitiesController < ApplicationController
  before_action :set_crime, only: [:index]

  def index
    crime = params[:crime]
    @cities = City.most_dangerous_cities(@crime)
    render json: @cities
  end

  private

  def set_crime
    @crime = params[:crime] || "violent_crime"
  end
end
