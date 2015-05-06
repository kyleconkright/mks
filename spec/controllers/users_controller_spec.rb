require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

describe "GET #index" do
	it "renders the index template and returns a status code of 200"
	it "assigns @users to include all users"
	it "is only accessable through the admin panel"
end

describe "GET #show" do
	it "renders the show template and returns a status code of 200"
	it "assigns @user to include just one user"
end

describe "GET #new" do
	it "render the new template and returns a status code of 200"
end

describe "POST #create" do
	it "commits an new item in the database"
	it  "includes changes made by the user in the new page"
end

describe "DELETE #destroy" do
	it "deletes a user from the database"
end

describe "GET #edit" do
	it "render the new template and returns a status code of 200"
end

describe "PUT/POST #update" do
	it "displays an altert to confirm the delete action before deleting the user"
	it "deletes a user from the database"
	it "redirects to the index page"
	it "only allows an admin to delete a user"
end


end #end the items controller spec test
