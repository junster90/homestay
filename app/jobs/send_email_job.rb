class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(booking)
    ReservationMailer.booking_email(booking).deliver_now
  end
end
