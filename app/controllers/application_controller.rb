class ApplicationController < ActionController::Base
  protect_from_forgery

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	
	before_filter :login_required, :except => [:index, :create, :auth]
	def login_required
		if current_user
			return
		else
			flash[:notice] = "Please login with Facebook!"
			redirect_to :root
		end
	end
end
