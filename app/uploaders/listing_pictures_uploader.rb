# encoding: utf-8

class ListingPicturesUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :standard do
    process :resize_to_fit => [400, 225, :north]
  end
  
  version :thumb do
    resize_to_fit(200, 113)
  end
end
