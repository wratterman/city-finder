class WelcomeController < ApplicationController

  def index
    state = set_state
    @states = {:all => State.all, :current => State.find_by(name: "Colorado")}
  end

  private

  def set_state
    State.find_by(name: "Colorado")
  end
end
