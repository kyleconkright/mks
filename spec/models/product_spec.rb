require 'rails_helper'

class ProductTest < ActiveSupport::TestCase

Rspec.describe Product do
	it "requires all billing information"
	it "requires user contributed text"
	it "exports a json object to send to scalable press"
end

end #end of Order model test