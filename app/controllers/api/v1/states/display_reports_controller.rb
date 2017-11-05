class Api::V1::States::DisplayReportsController < ApplicationController
  def index
    state_id = params[:state_id]
    reports = AvgWeeklyReport.where(state_id: state_id)
    render json: reports, each_serializer: DisplayReportSerializer
  end
end
