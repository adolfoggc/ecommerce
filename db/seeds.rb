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
Order.create(number: "77", delivery_fee: 6.80)
ProductOrder.create(order_id: 1, product_id: 1, quantity: 10, special_offer_id: nil)
ProductOrder.create(order_id: 1, product_id: 2, quantity: 10, special_offer_id: 2)
ProductOrder.create(order_id: 1, product_id: 5, quantity: 5, special_offer_id: 5)

Order.create(number:"88", delivery_fee: 7.0)
ProductOrder.create(order_id: 2, product_id: 2, quantity: 10, special_offer_id: 2)
ProductOrder.create(order_id: 2, product_id: 3, quantity: 10, special_offer_id: 4)
ProductOrder.create(order_id: 2, product_id: 4, quantity: 10, special_offer_id: nil)

puts ["Heh heh heh heh... Thank you!", "Is that all, stranger?", "Come back any time..."].sample