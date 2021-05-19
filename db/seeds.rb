# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Welcome!"
product_quote = ["Collecting products", "Counting products", "Got some rare things on sale, stranger!"].sample
puts product_quote
Product.create(description: "Macarrão Fortaleza", in_stock: 200, price: 7.5, bar_code: "123321")
Product.create(description: "Catchup Natchup", in_stock: 50, price: 12.0, bar_code: "335744")
Product.create(description: "Molho Três Queijos Predileta", in_stock: 50, price: 6.5, bar_code: "365478")
Product.create(description: "Salsicha de Peru Sadia", in_stock: 0, price: 9.8, bar_code: "556741")
Product.create(description: "Café Pilão", in_stock: 250, price: 5.6, bar_code: "336578")

special_offer_quote = ['The manager went crazy! See these discounts!', "There's a special offer for you", "I'll make you an offer you can't refuse..."].sample
puts special_offer_quote
SpecialOffer.create(kind: SpecialOffer.kinds[:pay_x_get_y], product_id: 1)
SpecialOffer.create(kind: SpecialOffer.kinds[:friendly_discount], product_id: 2)
SpecialOffer.create(kind: SpecialOffer.kinds[:pay_x_get_y], product_id: 3)
SpecialOffer.create(kind: SpecialOffer.kinds[:friendly_discount], product_id: 3)
SpecialOffer.create(kind: SpecialOffer.kinds[:friendly_discount], product_id: 5)

order_quote = ["What're ya buyin?", "What're ya sellin'?"].sample
puts order_quote
delivery_fee = (500..3000).to_a

(9*5).times do |order_number|
	Order.create(number: (order_number+1).to_s, delivery_fee: (delivery_fee.sample/100) )
	listed_products = []
	5.times do |product_number|
		product = Product.all.sample
		unless listed_products.include?(product)
			listed_products << product
			if product.special_offers.blank? 
				ProductOrder.create(order_id: order_number+1, product: product, quantity: (1..20).to_a.sample, special_offer_id: nil )
			else
				special_offers = product.special_offer_ids
				special_offers << nil
				ProductOrder.create(order_id: order_number+1, product: product, quantity: (1..20).to_a.sample, special_offer_id: special_offers.sample )
			end
		end
	end
end

puts ["Heh heh heh heh... Thank you!", "Is that all, stranger?", "Come back any time..."].sample