# frozen_string_literal: true

class AuthorsController < ApplicationController
  load_and_authorize_resource
  def index
    @authors = Author.all.sort_by(&:id)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save ? redirect_to(authors_path) : not_save
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params) ? redirect_to(authors_path) : not_save
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :id)
  end

  def not_save
    render :new, status: :unprocessable_entity
  end
end
