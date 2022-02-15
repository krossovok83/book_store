# frozen_string_literal: true

class BooksOrder < ApplicationRecord
  belongs_to :order
  belongs_to :book
end
