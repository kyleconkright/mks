class OrdersController < ApplicationController
  require 'httparty'

  def index
    @orders = HTTParty.get("https://api.scalablepress.com/v2/products/american-apparel-50-50-t-shirt")
  end

end
