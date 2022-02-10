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

  resources :users, only: [] do
    resources :orders, only: %i[create show]
  end

  scope "/checkout", controller: "checkout", as: "checkout" do
    get "address", to: "address"
    get "delivery", to: "delivery"
    get "payment", to: "payment"
    get "confirm", to: "confirm"
    get "complete", to: "complete"
  end

  resource :addresses, only: %i[new update] do
    put "check", to: "check"
  end

  root "home#home"
end
