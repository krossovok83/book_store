# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :id, :title, :author_id, :category_id, :price, :count, :year, :description, :height, :weight, :depth,
                :created_at, :updated_at, :materials, :cover
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
  filter :author_id,
         label: "Author",
         as: :select,
         collection: -> { Author.all.map { |author| ["#{author.last_name}, #{author.first_name}", author.id] } }
  filter :category_id,
         label: "Category",
         as: :select,
         collection: -> { Category.all.map { |category| [category.title, category.id] } }

  show do
    attributes_table do
      row :title
      row(:author) { |book| "#{book.author.last_name}, #{book.author.first_name}" }
      row(:category) { |book| book.category.title }
      row :description
      row :price
      row :year
      row :count
      row :height
      row :weight
      row :depth
      row :materials
      row :cover
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :year
      f.input :description
      f.input :author_id,
              label: "Author",
              as: :select,
              collection: Author.all.map { |author| ["#{author.last_name}, #{author.first_name}", author.id] }
      f.input :category_id,
              label: "Category",
              as: :select,
              collection: Category.all.map { |category| [category.title, category.id] }
      f.input :price
      f.input :weight
      f.input :height
      f.input :depth
      f.input :count
      f.input :cover
      f.input :materials
    end
    f.actions
  end
end
