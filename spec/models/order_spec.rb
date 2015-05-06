require 'rails_helper'

class OrderTest < ActiveSupport::TestCase

Rspec.describe Order do
	it "requires all billing information"
	it "rquires product information"
	it "creates a new id for the order"
	it "exports a json object to send to scalable press"
end

end #end of Order model test