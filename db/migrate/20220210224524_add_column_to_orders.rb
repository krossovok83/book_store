class AddColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivery, :string
    add_column :orders, :card_number, :integer
    add_column :orders, :card_date, :string
    change_column :orders, :status, :string
  end
end
