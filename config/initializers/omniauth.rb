Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '765509436888780', '370d758541e2943c44fef3354c68c0da'
end