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
	end


	def new
		@order = Order.new
	end


	def create
		@size = params[:order][:size]
		@quantity = params[:order][:quantity]

		# @design_id = get_design_id
		# @order_token = get_order_token(@design_id, @size, @quantity)
		# @remote_order = create_remote_order(@order_token)

		@order = Order.new

		if @order.save
			redirect_to root_path
		else
			render :new
		end
	end



	def get_design_id
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
		return @response["designId"]
	end

	def get_quote
		design_id = get_design_id
		size = params[:size]
		qty = params[:qty]

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
		            "quantity":qty,
		            "size":size
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
		    "designId":design_id
		}.to_json
		)
		@response
		render :json => @response
	end


	def create_remote_order
		order_token = params[:order_token]
		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/order/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {"orderToken":order_token}.to_json
		)
		@response
		render :json => @response

	end


end