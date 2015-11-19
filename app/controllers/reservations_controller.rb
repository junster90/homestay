class ReservationsController < ApplicationController
	
	def show
		@reservation = Reservation.find(params[:id])
		if current_user == @reservation.user
			render 'show'
		else
			redirect_to root_path
		end
	end

	def create
		booking = Reservation.new(user_params)
		booking.user_id = current_user.id

		if booking.save
			SendEmailJob.set(wait: 5.seconds).perform_later(booking)
			flash[:message] = "Your booking is successful!"
			redirect_to root_path
		else
			flash[:message] = "Sorry, your booking could not be completed."
			redirect_to listing_path(booking.listing_id)
		end
	end

private

	def user_params
		params.require(:booking).permit(:user_id, :listing_id, :check_in, :check_out, :message)
	end


end
