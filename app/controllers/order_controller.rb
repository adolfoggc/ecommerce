class OrderController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  end

  def show
  end

  def create
		@order = Order.new(order_params)

		respond_to do |format|
			if @order.save
				format.json { render json: @order, status: :created }
			else
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def order_params
		params.require(:order).permit(:number, :delivery_fee,
			listed_products: [ :product_id, :final_price, :quantity ])
	end

	def set_order
		@order = Order.find(params[:id])
	end
end
