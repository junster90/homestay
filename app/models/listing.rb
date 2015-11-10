class Listing < ActiveRecord::Base

	validates :name, :summary, :hometype, :roomtype, :max_guest, :line1, :city, :state, :country, :bedroom, :bed_count, :bathroom, :price, :user_id, presence: true

	belongs_to :user
end
