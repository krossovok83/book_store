class RenameCommentsToReviews < ActiveRecord::Migration[7.0]
  def change
    rename_table :comments, :reviews
  end
end
