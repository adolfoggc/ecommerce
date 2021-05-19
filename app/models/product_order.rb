class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :special_offer, optional: true
  before_save :check_final_price

  def check_final_price
    if self.special_offer.nil?
      price = self.normal_price
    else
      price = self.special_offer.special_price( self.quantity )
    end
    self.final_price = price
  end

  def normal_price
    price = self.product.price * self.quantity
  end

end
