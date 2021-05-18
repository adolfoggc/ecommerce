class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders
  accepts_nested_attributes_for :product_orders
end
