class Order < ApplicationRecord
	has_many :product_orders
	has_many :products, through: :product_orders

	after_create :create_related_product_order

	attr_accessor :listed_products

	def create_related_product_order
		self.listed_products.each do |product_order, attributes|
			po = ProductOrder.new(attributes)
			po.order_id = self.id
			po.save
		end
	end

	def total_order_amount
		total_order = 0
		self.product_orders.each do |po|
			total_order += po.order_product_price
		end
		return total_order
	end
end
