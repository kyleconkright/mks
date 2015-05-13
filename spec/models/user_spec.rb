require 'rails_helper'

class UserTest < ActiveSupport::TestCase



RSpec.describe "User" do
	it "can not be saved without a username" do
        user = FactoryGirl.build(:user, username: nil)
        expect(user).to  be_invalid
      end
	it "it cannnot be saved without an email" do 
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to be_invalid
      end
	it "must have a password"do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to be_invalid
      end
	it "pulls user information from Twitter's OAuth" do 
      end
      
end


end
