# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users # , ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books, only: %i[index show]
  root "home#home"
  resources :authors, except: [:show]
  resources :categories, except: [:show]
end
