# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    init_relation
  end

  def edit
    @book = Book.find(params[:id])
    init_relation
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params) ? redirect_to(book_path) : render(:new, status: :unprocessable_entity)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity

    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :price, :count, :year, :description, :height, :weight, :depth,
                                 :category_id)
  end

  def init_relation
    @category = []
    @author = []
    Category.all.each { |category| @category << [category.title.to_s, category.id] }
    Author.all.each { |author| @author << ["#{author.last_name} #{author.first_name}", author.id] }
  end
end
