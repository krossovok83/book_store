class ChangeColumnOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :number, :string
  end
end
