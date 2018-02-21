class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :cors_set_access_control_headers

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
  end
end
