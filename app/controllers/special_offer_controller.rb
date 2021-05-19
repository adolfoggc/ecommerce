class SpecialOfferController < ApplicationController
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
	
	private
		def special_offer_params
			params.require(:special_offer).permit(:product_id, :kind)
		end

		def set_special_offer
			@special_offer = SpecialOffer.find(params[:id])
		end
end
