class CrimeYearsController < ApplicationController
  def index
    render json: Crime.all
  end

  def show
    id = params[:id]
    render json: Crime.find(id)
  end
end
