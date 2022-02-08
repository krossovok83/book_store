# frozen_string_literal: true

class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    books = if params[:category_title] == "All" || params[:category_title].nil?
              Book.all
            else
              Book.where(category_id: find_category_id)
            end
    @books = books.order(custom_sort(params[:sort])).paginate(page: params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: @book.id, approved: true)
  end

  private

  def custom_sort(sort)
    case sort
    when "Newest first" then "created_at"
    when "Price: Low to high" then "price"
    when "Price: High to low" then "price DESC"
    when "Title: A to Z" then "title"
    when "Title: Z to A" then "title DESC"
    else
      "year"
    end
  end

  def find_category_id
    Category.find_by(title: params[:category_title]).id
  end
end
