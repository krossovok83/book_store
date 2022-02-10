# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    order = Order.new(status: "Waiting for processing", subtotal: cookies[:item_total],
                      order_total: cookies[:order_total], coupon: cookies[:coupon], user_id: current_user.id,
                      number: params[:number_order], delivery: cookies[:delivery], card_number: cookies[:card_number],
                      card_date: cookies[:card_date])
    order.books_orders << books_in_cart
    order.save ? clear_cart && redirect_to(checkout_complete_path, number: params[:number_order]) : redirect_back_or_to(carts_path)
  end

  private

  def books_in_cart
    books = []
    Cart.where(session: session[:current_user]).each { |position| books << BooksOrder.new(book_id: position.book_id) }
    books
  end

  def clear_cart
    Cart.where(session: session[:current_user]).destroy_all
    cookies.delete(:item_total)
    cookies.delete(:order_total)
    cookies.delete(:coupon)
    cookies.delete(:delivery)
    cookies.delete(:card_number)
    cookies.delete(:card_date)
    cookies.delete(:card_name)
    cookies.delete(:card_cvv)
  end
end
