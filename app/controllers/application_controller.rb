class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	#before_action :authenticate_user!
	before_action :configure_devise_permitted_parameters, if: :devise_controller?

	protected
	def configure_devise_permitted_parameters
		registration_params = [:gender, :name, :email, :password, :password_confirmation]
		devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
    	devise_parameter_sanitizer.permit(:account_update, keys: registration_params)
	end

	def after_sign_in_path_for(resource)
		stored_location_for(resource) || bookings_path
	end
end
