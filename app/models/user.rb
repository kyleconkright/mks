class User < ActiveRecord::Base
	belongs_to :address
	belongs_to :role
	has_many :orders
end
