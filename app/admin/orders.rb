# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :id, :number, :user_id, :status, :subtotal, :order_total, :coupon, :created_at, :updated_at, :delivery,
                :card_number, :card_date
  includes :user
  includes :books

  index do
    selectable_column
    column :number
    column(:user) { |order| order.user.email }
    column(:books) { |order| order.books.size }
    column :delivery
    column :status
    column :order_total
    column :created_at
    actions
  end

  filter :status, as: :select, collection: -> { ORDER_STATUS }
  filter :user_id,
         label: "User",
         as: :select,
         collection: -> { Order.select(:user_id).map { |order| [order.user.email, order.user_id] } }

  #   show do
  #     attributes_table do
  #       row :title
  #       row(:author) { |book| "#{book.author.last_name}, #{book.author.first_name}" }
  #       row(:category) { |book| book.category.title }
  #       row :description
  #       row :price
  #       row :year
  #       row :count
  #       row :height
  #       row :weight
  #       row :depth
  #       row :materials
  #       row :cover
  #     end
  #   end
  #
  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ORDER_STATUS
    end
    f.actions
  end
end
