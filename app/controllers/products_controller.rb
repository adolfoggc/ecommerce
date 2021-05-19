class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token
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
		products = Product.where("in_stock > 0")
		@products = Hash.new
		count = 0
		products.each do |product|
			dados_produto = Hash.new
			dados_produto[:product] = product
			unless product.special_offers.blank?
				special_offers = Hash.new
				count_offers = 0
				product.special_offers.each do |so|
					special_offers[count_offers] = so.kind
					count_offers += 1
				end
				dados_produto[:special_offers] = special_offers
			end
			@products[count] = dados_produto
			count += 1
		end
		respond_to do |format|
			format.json { render json: @products, status: :ok }
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
