# frozen_string_literal: true

class AddressesController < ApplicationController
  def new(type)
    type.create!(id: (Address.ids.last || 0) + 1, user_id: current_user.id)
  end

  def check
    billing = current_user.billing_address || new(BillingAddress)
    shipping = current_user.shipping_address || new(ShippingAddress)
    if update_transaction(billing, shipping)
      redirect_to checkout_delivery_path
    else
      redirect_to checkout_address_path
    end
  end

  def update
    if address.update(permitted_params)
      flash[:notice] = "#{params[:address_type].capitalize} address was updated successfully"
    else
      flash[:alert] = "#{params[:address_type].capitalize} don't updated"
    end
    redirect_back_or_to edit_user_registration_path
  end

  private

  def permitted_params
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
  end

  def check_params(type)
    params.require(type).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
  end

  def address
    if params[:address_type] == "billing"
      current_user.billing_address || new(BillingAddress)
    else
      current_user.shipping_address || new(ShippingAddress)
    end
  end

  def update_transaction(billing, shipping)
    Address.transaction do
      billing.update!(check_params(:billing))
      if params[:use_billing] == "0"
        shipping.update!(check_params(:shipping))
      else
        shipping.update!(check_params(:billing))
      end
    end
  end
end
