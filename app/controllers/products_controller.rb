class ProductsController < ApplicationController
	def show
	end

	def create
		@product = Product.new(product_params)
		
		respond_to do |format|
			if @product.save
				format.json { render json: @product, status: :created }
			else
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
	end

	def delete
	end

	def in_stock
	end

	private
		def product_params
			params.require(:product).permit(:description, :in_stock, :bar_code, :price)
		end
end
