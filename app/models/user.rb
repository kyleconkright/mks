class User < ActiveRecord::Base

	belongs_to :address
	belongs_to :role
	has_many :orders
	validates :username, presence: true
	validates :email, presence: true
	# attr_reader :password
	has_secure_password

	def self.find_or_create_from_auth_hash(auth_hash)
	  user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
	  user.update(
	    username: auth_hash.info.nickname,
	    name: auth_hash.info.name,
	    profile_image: auth_hash.info.image,
	    token: auth_hash.credentials.token,
	    secret: auth_hash.credentials.secret
	  )
	  user
	end
	
end
