class ReservationsController < ApplicationController
	
	def show
		@reservation = Reservation.find(params[:id])
		if current_user == @reservation.user
			render 'show'
		else
			redirect_to root_path
		end
	end

	def new
		if params[:booking] == nil
			redirect_to root_path
		else
			@booking = Reservation.new(user_params)
			@client_token = Braintree::ClientToken.generate
			@total = @booking.listing.price * (@booking.check_out.mjd - @booking.check_in.mjd)
		end
	end

	def create
		@booking = Reservation.new(user_params)
		@booking.user_id = current_user.id
		@total = @booking.listing.price * (@booking.check_out.mjd - @booking.check_in.mjd)

		if @booking.save
			result = Braintree::Transaction.sale(
	      :amount => "#{@total}",
	      :payment_method_nonce => params[:payment_method_nonce]
	    )
			if result.success?
				SendEmailJob.set(wait: 5.seconds).perform_later(@booking)
				flash[:message] = "Your payment and booking is successful!"
				redirect_to root_path
			else
				@booking.destroy
				flash[:message] = result.message
				render 'new'
			end
		else
			flash[:message] = "Sorry, your booking could not be completed."
			redirect_to listing_path(@booking.listing_id)
		end
	end

private

	def user_params
		params.require(:booking).permit(:user_id, :listing_id, :check_in, :check_out, :message)
	end


end
