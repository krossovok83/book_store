# frozen_string_literal: true

class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def create
    params[:count].to_i.times do
      @cart = Cart.new(params_id_session)
      @cart.save
    end
    redirect_back_or_to(root_path)
  end

  def index
    cart = Cart.where(session: session[:current_user])
    @counted_book = count_book(cart).sort
    @subtotal = cart.map { |i| i.book.price }.sum
    @order_total = order_total
  end

  def destroy
    params[:count].present? ? Cart.find_by(params_id_session).destroy : Cart.where(params_id_session).destroy_all
    redirect_to carts_path, status: 303
  end

  private

  def order_total
    @subtotal - (coupon || 0)
  end

  def count_book(cart)
    Hash[*cart.group_by(&:book_id).map { |i| [Book.find(i.first), i.last.size] }.flatten(1)]
  end

  def coupon; end

  def params_id_session
    { book_id: params[:book_id], session: session[:current_user] }
  end
end
