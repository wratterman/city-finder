class Api::V1::StatesController < ApplicationController
  def index
    render json: State.all
  end

  def show
    id = params[:id]
    render json: State.find(id)
  end
end
