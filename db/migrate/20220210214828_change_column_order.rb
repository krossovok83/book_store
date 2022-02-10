class ChangeColumnOrder < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :count, :status
    change_column :orders, :coupon, :decimal, precision: 8, scale: 2
    remove_column :orders, :book_id
  end
end
