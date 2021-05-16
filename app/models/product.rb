class Product < ApplicationRecord
  validates :in_stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bar_code, presence: :true

end
