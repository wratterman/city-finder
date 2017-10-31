class Api::V1::CrimeYearsController < ApplicationController
  before_action :set_year, only: [:index]

  def index
    render json: Crime.filter(@start_year)
  end

  def show
    year = params[:year]
    render json: Crime.find_by(year: year)
  end

  private

  def set_year
    @start_year = params[:year] || Crime.latest_year
  end
end
