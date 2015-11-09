class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:user][:email])

  	if @user && @user.authenticate(params[:user][:password])
  		login(@user)
  		flash[:message] = "Thank you for logging in #{@user.full_name}!"
  		redirect_to root_path
  	else
  		@error = "Invalid email or password"
  		render 'new'
  	end
  end

  def fb_create
  	auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)
    flash[:message] = "Thank you for logging in #{user.full_name}!"
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
  	session[:user_id] = nil
  	flash[:message] = "Logged out!"
  	redirect_to root_path
  end
end
