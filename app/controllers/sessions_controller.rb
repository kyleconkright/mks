class SessionsController < ApplicationController

def new
end

def create
	@user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id.to_s 
    redirect_to root_path
end

def destroy 
# delete that key/value pair in our sessions hash 
  session.delete(:user_id) 
  redirect_to login_path
end 

protected
  def auth_hash
    request.env['omniauth.auth']
  end


end
