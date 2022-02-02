# frozen_string_literal: true

class BooksController < ApplicationController
  load_and_authorize_resource
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  # def generate
  #   book = Book.new(title: ::FFaker::Book.title,
  #                   author_id: @author.map(&:last).sample,
  #                   category_id: @category.map(&:last).sample,
  #                   price: rand(10.0..90.0),
  #                   count: rand(5..30),
  #                   year: rand(1980..2021),
  #                   description: ::FFaker::Book.description,
  #                   height: rand(10.0..30.0),
  #                   weight: rand(10.0..30.0),
  #                   depth: rand(0.4..3),
  #                   created_at: DateTime.now,
  #                   updated_at: DateTime.now,
  #                   materials: "#{%w[Hardcover Softcover].sample}, #{%w[Glossy Mate].sample}paper",
  #                   cover: ::FFaker::Book.orly_cover)
  #   book.save
  #   redirect_to books_path
  # end
end
