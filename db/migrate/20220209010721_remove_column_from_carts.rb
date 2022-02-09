class RemoveColumnFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :count
  end
end
