class Product < ApplicationRecord
  has_many :product_orders
	has_many :orders, through: :product_orders
  has_many :special_offers

  validates :in_stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bar_code, presence: :true, uniqueness: true
end
