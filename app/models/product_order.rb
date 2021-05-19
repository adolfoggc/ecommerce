class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :special_offer, optional: true
  before_save :order_product_price

  def order_product_price()
    if self.special_offer.nil?
      price = self.product.price * self.quantity
    else
      price = self.special_offer.special_price( self.quantity)
    end
    self.final_price = price
  end

  def normal_price
    price = self.product.price * self.quantity
  end
end
