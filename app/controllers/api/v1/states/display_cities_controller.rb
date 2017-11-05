class Api::V1::States::DisplayCitiesController < ApplicationController
  def index
    state_id = params[:state_id]
    limit = params[:limit]
    cities = City.for_display(state_id, limit)
    render json: cities, each_serializer: DisplayCitySerializer
  end
end
