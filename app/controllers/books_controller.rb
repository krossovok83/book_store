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

  # rubocop:disable Metrics
  def generate
    init_relation
    book = Book.new(title: ::FFaker::Book.title,
                    author_id: @author.map(&:last).sample,
                    category_id: @category.map(&:last).sample,
                    price: rand(10.0..90.0),
                    count: rand(5..30),
                    year: rand(1980..2021),
                    description: ::FFaker::Book.description,
                    height: rand(10.0..30.0),
                    weight: rand(10.0..30.0),
                    depth: rand(0.4..3),
                    created_at: DateTime.now,
                    updated_at: DateTime.now,
                    materials: "#{%w[Hardcover Softcover].sample}, #{%w[Glossy Mate].sample}paper",
                    cover: ::FFaker::Book.orly_cover)
    book.save
    redirect_to books_path
  end
  # rubocop:enable Metrics

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :price, :count, :year, :description, :height, :weight, :depth,
                                 :category_id, :materials)
  end

  def init_relation
    @category = Category.all.map { |category| [category.title.to_s, category.id] }
    @author = Author.all.map { |author| ["#{author.last_name} #{author.first_name}", author.id] }
  end
end
