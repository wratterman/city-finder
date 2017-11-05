class WelcomeController < ApplicationController

  def index
    state = set_state
    # @models = {
    #   :econ_reports => State.display_reports(state.id),
    #   :cities => State.display_cities(state.id)
    # }
    @states = State.all
  end

  private

  def set_state
    State.find_by(name: "Colorado")
  end
end
