class ListingsController < ApplicationController

	def show
		@listing= Listing.find(params[:id])
	end

	def index
    @filterrific = initialize_filterrific(
    	Listing,
    	params[:filterrific]
  	) or return

		#@listings = @filterrific.find.page(params[:page])
		@listings = @filterrific.find

    respond_to do |format|
      format.html
      format.js
    end
  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_listings] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
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
		pictures = params[:listing][:pictures]

		if @listing.save
			pictures.each do |p|
				img = ListingPicture.new
				img.picture = p
				img.listing_id = @listing.id
				img.save
			end

			flash[:message] = "Successfully added your listing!"
			redirect_to root_path
		else
			flash[:message] = "There was a problem creating your lising. Try again."
			render 'new'
		end
	end

private

	def user_params
		params.require(:listing).permit(:name, :summary, :hometype, :roomtype, :max_guest, :line1, :line2, :city, :state, :country, :zip, :bedroom, :bed_count, :bathroom, :price, :user_id, :pictures)
	end

end
