class ListingsController < ApplicationController

	def show
	end

	def new
		if logged_in?
			render 'new'
		else
			flash[:message] = "Please log in to post a listing."
			redirect_to login_path
		end
	end

	def create
		@listing = Listing.new(user_params)
		@listing.user_id = current_user.id
		if @listing.save
			flash[:message] = "Successfully added your listing!"
			redirect_to root_path
		else
			flash[:message] = "There was a problem creating your lising. Try again."
			render 'new'
		end
	end

private

	def user_params
		params.require(:listing).permit(:name, :summary, :hometype, :roomtype, :max_guest, :line1, :line2, :city, :state, :country, :zip, :bedroom, :bed_count, :bathroom, :price, :user_id)
	end

end
