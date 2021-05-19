class SpecialOfferController < ApplicationController
	before_action :set_special_offer, only: [:update, :destroy]

	def create
		@special_offer = SpecialOffer.new(special_offer_params)
		
		respond_to do |format|
			if @special_offer.save
				format.json { render json: @special_offer, status: :created }
			else
				format.json { render json: @special_offer.errors, status: :unprocessable_entity }
			end
		end
	end

	def update	
		respond_to do |format|
			if @special_offer.update(special_offer_params)
				format.json { render json: @special_offer, status: :ok }
			else
				format.json { render json: @special_offer.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def destroy
    respond_to do |format|
			if @special_offer.destroy
				format.json { head :no_content }
      else
				format.json { render json: @special_offer.errors, status: :unprocessable_entity }
			end
    end
	end

	private
		def special_offer_params
			params.require(:special_offer).permit(:product_id, :kind)
		end

		def set_special_offer
			@special_offer = SpecialOffer.find(params[:id])
		end
end
