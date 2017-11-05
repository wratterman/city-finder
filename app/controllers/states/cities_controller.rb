class States::CitiesController < ApplicationController

  def show
    @city = City.find(params[:city_id])
  end
end
