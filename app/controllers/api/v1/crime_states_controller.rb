class Api::V1::CrimeStatesController < ApplicationController
  def index
    @states = State.all
    render json: @states, each_serializer: CrimeStatesSerializer
  end

  def show
    @state = State.find_by(name: params[:state].downcase.capitalize)
    render json: @state, serializer: CrimeStatesSerializer
  end

  def redirect_to_show
    redirect_to action: :show
  end
end
