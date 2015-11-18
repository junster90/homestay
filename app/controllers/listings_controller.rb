class ListingsController < ApplicationController

	respond_to :html, :js

	def show
		@listing = Listing.find(params[:id])
	end

	def index
		@results = Listing.search(params[:search][:query])
		start_date = Date.parse(params[:search][:check_in]) if params[:search][:check_in] != ""
		end_date = Date.parse(params[:search][:check_out]) if params[:search][:check_in] != ""
		@listings = []
		
		@results.each do |result|
			qualify = []
			result.reservations.each do |reservation|
				qualify << overlaps?(start_date, end_date, reservation.check_in, reservation.check_out)
			end
			@listings << result if !qualify.include?(true)
		end
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
		byebug
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

  def overlaps?(start_date, end_date, booking_start_date, booking_end_date)
    (start_date - booking_end_date) * (booking_start_date - end_date) >= 0
  end
end
