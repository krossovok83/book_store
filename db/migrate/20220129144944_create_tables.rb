class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.belongs_to :author, null: false, foreign_key: true, index: true
      t.belongs_to :category, null: false, foreign_key: true, index: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :count
      t.integer :year
      t.string :description
      t.decimal :height, precision: 8, scale: 2
      t.decimal :weight, precision: 8, scale: 2
      t.decimal :depth, precision: 8, scale: 2
      t.timestamps
    end
  end
end
