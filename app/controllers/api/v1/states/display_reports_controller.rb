class Api::V1::States::DisplayCitiesController < ApplicationController
  def index
    state_id = params[:state_id]
    reports = AvgWeeklyReport.where(state_id: state_id)
    render json: reports
  end
end
