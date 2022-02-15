class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.integer :count
      t.integer :year
      t.string :description
      t.integer :height
      t.integer :weight
      t.integer :depth

      t.timestamps
    end
  end
end
