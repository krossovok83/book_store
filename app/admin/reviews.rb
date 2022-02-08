# frozen_string_literal: true

ActiveAdmin.register Review do
  permit_params :id, :title, :user_id, :book_id, :review, :rating, :approved, :created_at, :updated_at
  includes :user
  includes :book

  index do
    selectable_column
    column :title
    column :review
    column(:user) { |review| review.user&.email }
    column(:book) { |review| review.book.title }
    column :rating
    column :approved
    actions
  end

  filter :title
  filter :user_id,
         label: "User",
         as: :select,
         collection: -> { User.all.map { |user| [user.email, user.id] } }
  filter :book_id,
         label: "Book",
         as: :select,
         collection: -> { Book.all.map { |book| [book.title, book.id] } }

  show do
    attributes_table do
      row :title
      row :review
      row(:user) { |review| review.user&.id }
      row(:book) { |review| review.book.title }
      row :rating
      row :approved
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :review
      f.input :approved
    end
    f.actions
  end
end
