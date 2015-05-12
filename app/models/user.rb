class User < ActiveRecord::Base

	belongs_to :address
	belongs_to :role
	has_many :orders
	validates :username, presence: true
	validates :email, presence: true
	# attr_reader :password
	has_secure_password

end
