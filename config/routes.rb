# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :books
  root "home#home"
  resources :authors, except: [:show]
  resources :categories, except: [:show]
  get "/generate_books", to: "books#generate"
end
