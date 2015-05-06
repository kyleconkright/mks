require 'rails_helper'

class UserTest < ActiveSupport::TestCase

Rspec.describe User do
	it "must have a username"
	it "must have an email"
	it "must have a password"
	it "pulls user information from Twitter's OAuth"
end


end
