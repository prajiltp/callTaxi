class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :set_timezone, :set_default_response_format

  def set_timezone
    Time.zone = 'Chennai'
  end

  def set_default_response_format
    request.format = :json unless params[:controller] == 'cabs' && params[:action] == 'index'
  end
end
