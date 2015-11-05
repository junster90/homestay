class User < ActiveRecord::Base
	has_secure_password
	validates :full_name, :email, presence: true
	validates :email, uniqueness: true

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.full_name = auth.info.name
    user.email = auth.info.email
    user.password = SecureRandom.base64
    user.oauth_token = auth.credentials.token
    user.save!
  end
	end
end
