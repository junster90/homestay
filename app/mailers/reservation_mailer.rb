class ReservationMailer < ApplicationMailer

	def booking_email(customer, host, reservation_id)
		@host = host
		@customer = customer
		@reservation = Reservation.find(reservation_id)
		@url = "http://localhost:3000"

		mail(to: @host, subject: "You have received a booking from #{@customer}")
	end
end
