# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
  belongs_to :category, counter_cache: true
end
