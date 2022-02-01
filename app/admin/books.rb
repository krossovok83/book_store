# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :all
  includes :author
  includes :category

  index do
    selectable_column
    column :title
    column(:author) { |book| "#{book.author.last_name}, #{book.author.first_name}" }
    column(:category) { |book| book.category.title }
    column :description
    column :price
    actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :year
    end
    f.actions
  end
end
