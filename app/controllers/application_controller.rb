class ApplicationController < ActionController::Base
  protect_from_forgery

  def routing_error
    raise ActionController::RoutingError.new('Not Found')
  end
end
