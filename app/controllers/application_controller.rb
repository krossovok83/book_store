# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :create_session

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  private

  def create_session
    return unless session[:current_user].nil?

    session[:current_user] = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
