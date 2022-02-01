# frozen_string_literal: true

class HomeController < ApplicationController
  def home
    @last_books = Book.last(3)
    @active_book = @last_books.pop
  end
end
