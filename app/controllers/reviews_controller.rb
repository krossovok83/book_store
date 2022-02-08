# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    Review.create!(params_permit.merge({ user_id: current_user&.id, rating: 4 }))
  end

  private

  def params_permit
    params.permit(:title, :review, :book_id)
  end
end
