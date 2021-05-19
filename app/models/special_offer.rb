class SpecialOffer < ApplicationRecord
  belongs_to :product

  # Kind of special offer defines the final price
  # pay_x_get_y: If someone buys n or more units of a product, pays only n-1 units, where n >= 3
  # friendly_discount: It's a 5% discount

  enum kind: {
    pay_x_get_y: 0,
    friendly_discount: 1
  }

  def special_price price, quantity
    if (self.kind == SpecialOffer.kinds[:pay_x_get_y]) && (quantity >= 3)
      return price * (quantity - 1)
    elsif self.kind == SpecialOffer.kinds[:friendly_discount]
      return (price * quantity)*0.95
    else
      return (price * quantity
    end
  end
end
