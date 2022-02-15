# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :id, :first_name, :last_name

  index do
    selectable_column
    column :last_name
    column :first_name
    column :Book do |author|
      author.books.count
    end
    actions
  end

  filter :last_name
  filter :first_name

  form do |f|
    f.inputs do
      f.input :last_name
      f.input :first_name
    end
    f.actions
  end
end
