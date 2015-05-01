class User < ActiveRecord::Base
belongs_to :address
belongs_to :role
end
