class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def order_product_price
    if self.final_price.nil?
      price = self.product.price
    else
      price = self.final_price
    end
    return price*self.quantity
  end
end
