module ReservationsHelper
	def booked_dates(listing_id)
		dates =[]
		bookings = Reservation.where(listing_id: listing_id)
		bookings.each do |b|
			dates += (b.check_in..b.check_out-1).map(&:to_s)
		end
		
		return dates
	end
end
