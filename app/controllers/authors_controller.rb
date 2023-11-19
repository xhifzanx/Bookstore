class AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_authors, only: %i[show edit update destroy]
  def index
    @authors = Author.all
  end
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
    redirect_to authors_path
    flash[:notice] = "New Author saved"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      redirect_to authors_path
    end
  end

 
  private 
  def author_params
    params.require(:author).permit(:first_name, :last_name, :images)
  end
  def set_authors
    @author = Author.find(params[:id])
  end
end
