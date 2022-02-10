# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :check_login

  def address
    @user = current_user
    cookies[:item_total] = Cart.where(session: session[:current_user]).map { |i| i.book.price }.sum
    cookies[:order_total] = cookies[:item_total]
  end

  def delivery
    binding.pry
  end

  private

  def check_login
    return unless current_user.nil?

    redirect_to new_user_session_path, alert: "You must be logged in to perform the following actions"
  end

  def permit_billing
    params.permit(:first_name, )
  end

end
