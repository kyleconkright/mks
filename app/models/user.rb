class User < ActiveRecord::Base

	belongs_to :address
	belongs_to :role
	has_many :orders
	validates :name, presence: true
	# validates :email, presence: true, unless: :twitter_login?
	attr_reader :password
	has_secure_password
	# validates :password, presence: true, unless: :twitter_login?

	def twitter_login?
		self.uid ? true : false
	end
	 
	def self.find_or_create_from_auth_hash(auth_hash)
	  user = User.where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
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
