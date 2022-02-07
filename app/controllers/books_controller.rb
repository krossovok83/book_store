# frozen_string_literal: true

class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:category_title] == "All" || params[:category_title].nil?
      @books = Book.all.order(custom_sort(params[:sort])).paginate(page: params[:page])
    else
      @books = Book.where(category_id: Category.find_by(title: params[:category_title]).id).paginate(page: params[:page])
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
    when "Title: A to Z" then "title"
    when "Title: Z to A" then "title DESC"
    else
      "year"
    end
  end
end
