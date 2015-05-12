class OrdersController < ApplicationController

  def index
    auth = {:password => "46e962e02726ac0806b97303e97983e8"}
    @orders = HTTParty.get("https://api.scalablepress.com/v2/order/", :basic_auth => auth)
  end

  def create
    @order = HTTParty.post("https://api.scalablepress.com/v2/design", :headers => {"Content-Type" => "application/json", "Authorization" => ENV["scalable_press_test_key"]})
  end

   
end
