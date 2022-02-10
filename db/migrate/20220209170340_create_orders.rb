class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :count
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :order_total, precision: 8, scale: 2
      t.integer :coupon

      t.timestamps
    end
  end
end
