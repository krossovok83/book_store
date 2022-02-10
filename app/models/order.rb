# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :books_orders, dependent: :destroy
  has_many :books, through: :books_orders
  belongs_to :user
end
