# frozen_string_literal: true

class BooksController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:category_title] == "all"
      @books = Book.all.order(custom_sort(params[:sort]))
    else
      @books = Book.where(category_id: Category.find_by(title: params[:category_title]).id)
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def custom_sort(sort)
    case sort
    when "Newest first" then "created_at"
    when "Price: Low to high" then "price"
    when "Price: High to low" then "price DESC"
    else
      "year"
    end
  end
end
