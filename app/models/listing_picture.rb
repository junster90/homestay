class ListingPicture < ActiveRecord::Base

	validates :listing_id, :picture, presence: true

	belongs_to :listing

	mount_uploader :picture, ListingPicturesUploader
end
