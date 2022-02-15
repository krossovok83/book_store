class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :book, null: false, foreign_key: true
      t.string :session, null: false
      t.integer :coupon
      t.decimal :discount, precision: 8, scale: 2
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.timestamps
    end
  end
end
