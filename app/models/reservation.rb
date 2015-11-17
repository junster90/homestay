class Reservation < ActiveRecord::Base

	validates :user_id, :listing_id, :check_in, :check_out, presence: true
	validates :check_in, :check_out, :overlap => {:scope => "listing_id", :exclude_edges => "check_out"}

	belongs_to :user
	belongs_to :listing
end
