class UsersController < ApplicationController

	def new

	end

	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			flash[:message] = "Thank you for signing up!"
			redirect_to root_path
		else
			render 'new'
		end
	end

private

	def user_params
		params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
	end

end