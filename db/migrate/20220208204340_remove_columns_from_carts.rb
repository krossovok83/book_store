class RemoveColumnsFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :discount, :string
    remove_column :carts, :subtotal, :string
    remove_column :carts, :total, :string
  end
end
