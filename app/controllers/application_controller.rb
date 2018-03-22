class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	helper_method :current_user

	private

	def require_login
		  redirect_to '/sign_in' unless current_user
    end

  def logged_in?
  	current_user != nil
  end	

end