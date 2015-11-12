class AvatarUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end
  
  version :thumb do
    resize_to_fit(50, 50)
  end

end
