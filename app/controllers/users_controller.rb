# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource

  def edit
    @user = User.find(current_user.id)
  end
end
