class MistyController < ApplicationController

  def index
    object = {
      mood: 1
    }
    render json: object
  end
end
