# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users # , ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :categories, param: :title, only: [] do
    resources :books, only: :index
  end

  resources :books, only: :show do
    resources :reviews, only: :create
  end

  scope(path_names: { create: "create" }) do
    resource :carts do
      get "/", to: "carts#index"
    end
  end

  resource :addresses, only: %i[new update]

  root "home#home"
end
