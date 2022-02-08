# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users # , ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :categories, param: :title, only: [] do
    resources :books, only: :index
  end

  resources :books, only: :show

  resource :addresses

  root "home#home"
end
