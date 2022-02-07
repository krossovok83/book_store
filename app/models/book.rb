# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  self.per_page = 12
end
