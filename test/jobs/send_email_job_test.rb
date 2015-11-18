require 'test_helper'

class SendEmailJobTest < ActiveJob::TestCase
  def perform(booking)
    ReservationMailer.booking_email(booking).deliver_now
  end
end
