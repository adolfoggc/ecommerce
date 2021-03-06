class OrderController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_order, only: [:show]

  def index
		if params[:order].blank?
			@orders = Order.all
			@order = Order.new
		else
			@order = Order.new(order_params)
			@orders = Order.where("number LIKE '%#{ order_params[:number] }%'")
		end
		@total_paginations = @orders.count/5
		@total_paginations += 1 if @orders.count%5 > 0
		@orders = @orders.offset(@order.offset.to_i * 5).limit(5)
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
		params.require(:order).permit(:number, :delivery_fee, :offset,
			listed_products: [ :product_id, :final_price, :quantity ])
	end

	def set_order
		@order = Order.find(params[:id])
	end
end
