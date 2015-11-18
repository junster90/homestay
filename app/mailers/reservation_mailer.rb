class ReservationMailer < ApplicationMailer

	def booking_email(reservation)
		@reservation = reservation
		@customer = reservation.user
		@room = reservation.listing
		@host = @room.user


		mail(to: "#{@host.email}", subject: "You have received a booking from #{@customer.full_name}")
	end
end
