# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :id, :email, :password, :password_confirmation, :reset_password_token, :reset_password_sent_at,
                :remember_created_at, :created_at, :updated_at, :provider, :uid, :name, :image

  index do
    selectable_column
    column :email
    column :created_at
    column :admin
    column :name
    actions
  end

  filter :email
  filter :admin
  filter :name

  form do |f|
    f.inputs do
      f.input :email
      f.input :admin
      f.input :name
    end
    f.actions
  end
end
