# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :check_login

  DELIVERY = {
    self: %w[0 Self-Delivery! Whenever],
    today: ["28.50", "Delivery Today!", "1 days"],
    week: ["20.00", "Delivery During The Week!", "3 to 7 days"],
    month: ["10.75", "Delivery From A Week To A Month!", "7 to 30 days"]
  }.freeze

  def address
    cart = Cart.where(session: session[:current_user])
    cookies[:item_total] = cart.map { |i| i.book.price }.sum
    cookies[:order_total] = cookies[:item_total]
    cookies[:coupon] = cart.first.coupon || 0
  end

  def delivery
    @delivery = DELIVERY
  end

  def payment
    cookies[:delivery] = params[:delivery]
    cookies[:order_total] = cookies[:item_total].to_f - cookies[:coupon].to_f + DELIVERY[cookies[:delivery].to_sym].first.to_f
  end

  def confirm
    cookies.encrypted[:card_number] = params[:card_number]
    cookies.encrypted[:card_date] = params[:exp_date]
    cookies.encrypted[:card_name] = params[:card_name]
    cookies.encrypted[:card_cvv] = params[:cvv]
    @shipping = current_user.shipping_address
    @billing = current_user.billing_address
    @delivery = DELIVERY
    @cart = count_book(Cart.where(session: session[:current_user])).sort
  end

  def complete
    @order = Order.find_by(number: params[:number_order])
    @cart = count_book(BooksOrder.where(order_id: @order.id)).sort
    @shipping = current_user.shipping_address
  end

  private

  def check_login
    return unless current_user.nil?

    redirect_to new_user_session_path, alert: "You must be logged in to perform the following actions"
  end

  def count_book(source)
    Hash[*source.group_by(&:book_id).map { |i| [Book.find(i.first), i.last&.size] }.flatten(1)]
  end
end
