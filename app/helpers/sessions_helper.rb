module SessionsHelper

	def login(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id] != nil
	end

	def logged_in?
		current_user != nil
	end

end