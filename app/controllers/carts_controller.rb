# frozen_string_literal: true

class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def create
    params[:count].times do
      @cart = Cart.new(book_id: params[:book_id], session: session[:current_user])
      @cart.save
    end
    redirect_back_or_to(root_path)
  end

  def index
    cart = Cart.where(session: session[:current_user])
    @counted_book = count_book(cart)
    @subtotal = cart.map { |i| i.book.price }.sum
    @order_total = order_total
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  def update
    binding.pry
  end

  private

  def order_total
    @subtotal - (coupon || 0)
  end

  def count_book(cart)
    Hash[*cart.group_by(&:book_id).map { |i| [Book.find(i.first), i.last.size] }.flatten(1)]
  end

  def coupon; end
end
