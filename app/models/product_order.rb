class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :special_offer, optional: true

  def order_product_price()
    if self.special_offer.nil?
      price = self.product.price * self.quantity
    else
      price = self.special_offer.special_price( self.quantity)
    end
    return price
  end
end
