# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :review, dependent: :destroy
  has_many :orders
  self.per_page = 12
end
