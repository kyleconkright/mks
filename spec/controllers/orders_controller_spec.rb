require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
# ==== CONTROLLER TESTS ====

describe "GET #index" do
	it "renders the index template and returns status code of 200"
	it "assigns @orders to include all orders"
	it "is only accessable through the admin panel"
end

describe "GET #show" do
	it "should render the show template and returns a status code of 200"
	it "assigns @order to include just one order"
	it "shows the status of each order via updates from the scalable press api"
	it "only order notes can be viewed or edited by admin"
		# not sure if this is added to show or edit - ive included in both places
end

describe "GET #new" do
	it "renders the new template as a partial"
	it "returns a status code of 200"
	#this will likely exist only on the main page
end

describe "POST #create" do
	it "commits a new order in the database"
	it "sends the order to the scalable press api"
	it "requires that all infomation to be filled out"
end

describe "DELETE #destroy" do
	it "does not allow any orders to be destroyed"
end

describe "GET #edit" do
	it "renders the edit template and returns a status code of 200"
	it "is only accessable to admins"
	it "only allows notes to be edited"
	  # not sure if this is added to show or edit - ive included in both places
end

describe "PUT/POST #update" do
	it "commits changes in order notes to the database"
	it "redirects to the index page"
end

end #end the items controller spec test