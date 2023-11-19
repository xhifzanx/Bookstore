class CategoriesController < ApplicationController
  # before_action :set_books
    before_action :authenticate_user!
  before_action :set_category, only: %i[edit show update destroy]

    def index
    @categories = Category.all
    end



  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
        redirect_to categories_path
        flash[:notice] = "New Category saved successfully"
    else
        render :new
    end

  end

  def edit
  end

  def show
    @categories = Category.all
    @books = @category.books
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end

  end

  def destroy
    if @category.destroy
      redirect_to categories_path
    else
      render :new
    end
  end

  private 

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
