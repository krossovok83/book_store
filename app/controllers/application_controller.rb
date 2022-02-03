# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
end
