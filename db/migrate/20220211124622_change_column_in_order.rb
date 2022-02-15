class ChangeColumnInOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :status, :string, null: false
    change_column :orders, :delivery, :string, null: false
    change_column :orders, :card_number, :string, null: false
    change_column :orders, :card_date, :string, null: false
    change_column :orders, :number, :string, null: false
  end
end
