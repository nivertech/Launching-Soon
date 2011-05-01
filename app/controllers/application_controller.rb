class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :no_www
  
  private
  
  def no_www
    if /^www/.match(request.host)
      redirect_to 'http://' + DEFAULT_HOST + request.request_uri
      flash.keep
    end
  end
end