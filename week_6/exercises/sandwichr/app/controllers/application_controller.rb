class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :confirgure_permitted_parameters, if: :devise_controller?

  protected
  	def confirgure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up).push(:name)
  	end
end
