# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :review, dependent: :destroy
  has_many :books_orders
  has_many :orders, through: :books_orders
  self.per_page = 12
end
