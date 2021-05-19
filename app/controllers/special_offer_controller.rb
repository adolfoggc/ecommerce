class SpecialOfferController < ApplicationController
	private
		def special_offer_params
			params.require(:special_offer).permit(:product_id, :kind)
		end
end
