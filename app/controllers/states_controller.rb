class StatesController < ApplicationController

  before_action :sanitize_state, only: [:show]

  def index
    @states = State.all
  end

  def show
  end

  private

  def sanitize_state
    if params[:state].include?("_")
      state_name = capitalize_first_letter(params[:state])
    else
      state_name = params[:state].capitalize
    end
    @state = State.find_by(name: state_name)
  end

  def capitalize_first_letter(state)
    multiname_state = state.split("_")
    multiname_state.map! do |name|
      name.capitalize
    end
  end
end
