class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :update, :destroy]

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
		respond_to do |format|
			if @product.update(product_params)
				format.json { render json: @product, status: :ok }
			else
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
    respond_to do |format|
			if @product.destroy
				format.json { head :no_content }
      else
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
    end
	end

	def in_stock
		@product = Product.where("in_stock > 0")

		respond_to do |format|
			format.json { render json: @product, status: :ok }
		end
	end

	private
	def product_params
		params.require(:product).permit(:description, :in_stock, :bar_code, :price)
	end
	
	def set_product
		@product = Product.find(params[:id])
	end
end
