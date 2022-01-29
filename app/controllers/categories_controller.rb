# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all.sort_by(&:id)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save ? redirect_to(categories_path) : not_save
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params) ? redirect_to(categories_path) : not_save
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :id)
  end

  def not_save
    render :edit, status: :unprocessable_entity
  end
end
