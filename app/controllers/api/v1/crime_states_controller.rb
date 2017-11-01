class Api::V1::CrimeStatesController < ApplicationController
  def index
    @states = State.all
    render json: @states, each_serializer: CrimeStatesSerializer
  end

  def show
    id = params[:id]
    @state = State.find(id)
    render json: @state, serializer: CrimeStatesSerializer
  end
end
