class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

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

	def edit
		if current_user.id != params[:id].to_i
			redirect_to root_path
		else
			@user = current_user
		end
	end

	def update

		@user = current_user
		@user.full_name = params[:user][:full_name]
		@user.email = params[:user][:email]
		@user.avatar = params[:user][:avatar]

		if @user.save
			flash[:message] = "Profile updated!"
			redirect_to user_path(current_user.id)
		else
			flash[:message] = "There was a problem updating your profile"
			render 'edit'
		end
	end

private

	def user_params
		params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
	end

end