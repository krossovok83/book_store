# frozen_string_literal: true

class AuthorsController < ApplicationController
  load_and_authorize_resource
end
