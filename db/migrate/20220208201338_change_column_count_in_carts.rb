class ChangeColumnCountInCarts < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :count, :integer, default: 1
  end
end
