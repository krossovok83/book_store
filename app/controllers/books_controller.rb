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
    when "newest_first" then "created_at"
    when "price_up" then "price"
    when "price_down" then "price DESC"
    else
      "year"
    end
  end
end
