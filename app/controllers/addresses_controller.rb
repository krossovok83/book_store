# frozen_string_literal: true

class AddressesController < ApplicationController
  def new(type)
    type.create!(id: (Address.ids.last || 0) + 1, user_id: current_user.id)
  end

  def update
    if address.update(permitted_params)
      flash[:notice] = "#{params[:address_type].capitalize} address was updated successfully"
    else
      flash[:alert] = "#{params[:address_type].capitalize} don't updated"
    end
    redirect_to edit_user_registration_path
  end

  private

  def permitted_params
    params.permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
  end

  def address
    if params[:address_type] == "billing"
      current_user.billing_address || new(BillingAddress)
    else
      current_user.shipping_address || new(ShippingAddress)
    end
  end
end
