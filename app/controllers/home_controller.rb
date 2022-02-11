# frozen_string_literal: true

class HomeController < ApplicationController
  def home
    @last_books = Book.last(3)
    @active_book = @last_books.pop
    @bestsellers = BooksOrder.group(:book_id).count.sort_by { |_key, value| -value }.first(4).map { |i| Book.find(i.first) }
  end
end
