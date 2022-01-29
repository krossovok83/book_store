class AddMaterialsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :materials, :string
  end
end
