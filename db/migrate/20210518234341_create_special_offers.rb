class CreateSpecialOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :special_offers do |t|
      t.integer :kind
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
