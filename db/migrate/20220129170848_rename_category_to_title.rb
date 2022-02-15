class RenameCategoryToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :category, :title
  end
end
