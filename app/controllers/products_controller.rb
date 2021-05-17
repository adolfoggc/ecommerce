class ProductsController < ApplicationController

	def show
	end

	def create
	end

	def update
	end

	def delete
	end

	def on_stock
	end

	private
		def product_params
			params.require(:product).permit(:description, :in_stock, :bar_code, :price)
		end
end
