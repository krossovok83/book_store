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

  def generate
    init_relation
    book = Book.new
    book.title = ::FFaker::Book.title
    book.author_id = @authors_id.sample
    book.category_id = @categories_id.sample
    book.price = rand(10.0..90.0)
    book.count = rand(5..30)
    book.year = rand(1980..2021)
    book.description = ::FFaker::Book.description
    book.height = rand(10.0..30.0)
    book.weight = rand(10.0..30.0)
    book.depth = rand(0.4..3)
    book.created_at = DateTime.now
    book.updated_at = DateTime.now
    book.materials = "#{%w[Hardcover Softcover].sample}, #{%w[Glossy Mate].sample}paper"
    book.cover = ::FFaker::Book.orly_cover
    book.save
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :price, :count, :year, :description, :height, :weight, :depth,
                                 :category_id, :materials)
  end

  def init_relation
    @categories_id = []
    @authors_id = []
    @category = []
    @author = []
    Category.all.each { |category| @category << [category.title.to_s, category.id] }
    Author.all.each { |author| @author << ["#{author.last_name} #{author.first_name}", author.id] }
    @category.each { |i| @categories_id << i.last }
    @author.each { |i| @authors_id << i.last }
  end
end
