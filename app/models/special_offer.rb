class SpecialOffer < ApplicationRecord
  belongs_to :product

  enum kind: {
    pay_x_get_y: 0,
    friendly_discount: 1
  }
end
