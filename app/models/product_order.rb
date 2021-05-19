class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :special_offer, optional: true
  before_save :check_special_offers

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

  def check_special_offers
    unless self.product.special_offers.include?(self.special_offer)
      self.special_offer = nil
    end
    self.check_final_price
  end

  def special_offer_name
    if self.special_offer.nil?
      return "Nenhuma"
    elsif self.special_offer.friendly_discount?
      return "Desconto Especial"
    elsif self.special_offer.pay_x_get_y?
      return "Leve X e Pague Y"
    end
  end

end
