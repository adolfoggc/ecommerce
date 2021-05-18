class AddFinalPriceToProductOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :product_orders, :final_price, :decimal
  end
end
