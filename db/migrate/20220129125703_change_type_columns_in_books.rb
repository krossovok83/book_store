class ChangeTypeColumnsInBooks < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.change :height, :float
      t.change :weight, :float
      t.change :depth, :float
    end
  end
end
