class Order < ApplicationRecord
	has_many :product_orders
	has_many :products, through: :product_orders
	validates :number, presence: :true, uniqueness: true

	attr_accessor :listed_products
	attr_accessor :offset
	after_create :create_related_product_order, unless: Proc.new { self.listed_products.nil? }

	def create_related_product_order
		self.listed_products.each do |product_order, attributes|
			po = ProductOrder.new(attributes)
			po.order_id = self.id
			po.save
		end
	end

	def total_order_amount
		total_order = self.delivery_fee
		self.product_orders.each do |po|
			total_order += po.final_price
		end
		return total_order
	end
end
