class OrdersController < ApplicationController

	# @response = HTTParty.post(
	# 	"https://api.scalablepress.com/v2/order/",
	# 	:basic_auth => auth,
	# 	:headers => {'Content-Type' => 'application/json'},
	# 	:body => {"orderToken":"order_E61NFfzipHnDMB-KOpu_Hw"}.to_json
	# 	)

	def auth
		{:password => ENV['scalable_press_test_key']}
	end

	def index
		@orders = HTTParty.get("https://api.scalablepress.com/v2/order/", :basic_auth => auth)

		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/design/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {
		    "type":"screenprint",
		    "sides": {
		        "front": {
		          "colors": [
		            "white"
		          ],
		          "dimensions": {
		            "width": 5
		          },
		          "position": {
		            "horizontal": "C",
		            "offset": {
		              "top": 2.5
		            }
		          },
		          "artwork": "http://ga.kyleconkright.com/mks/img.eps"
		        }
		    }
		}.to_json
		)
		@designId = @response["designId"]

		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/quote/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {
		    "type":"screenprint",
		    "sides":{"front":"1"},
		    "products":[
		        {
		            "id":"american-apparel-50-50-t-shirt",
		            "color":"heather black",
		            "quantity":"1",
		            "size":"med"
		        }
		    ],
		    "address": {
		        "name": "My Customer",
		        "address1": "123 Scalable Drive",
		        "city": "West Pressfield",
		        "state": "CA",
		        "zip": "90210",
		        "country": "US"
		    },
		    "designId":@designId
		}.to_json
		)

		@orderToken = @response["orderToken"]

		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/order/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {"orderToken":@orderToken}.to_json
		)
	end

	def new
		@order = Order.new
	end


	def create

		@order = Order.new

		if @order.save
			redirect_to root_path
		else
			render :new
		end
	end



end