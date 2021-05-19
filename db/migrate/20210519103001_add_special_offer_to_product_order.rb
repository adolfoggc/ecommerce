class AddSpecialOfferToProductOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_orders, :special_offer, foreign_key: true
  end
end
