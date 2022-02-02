# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :id, :first_name, :last_name

  index do
    selectable_column
    column :title
    column :Book do |category|
      category.books.count
    end
    actions
  end

  filter :title
end
