class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  before_action :set_books, only: %i[edit show update destroy]
  def index
    @books = Book.all
    @categories = Category.all
  end

  def new
    @book = Book.new 
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else 
      render :new
    end
  end

  def edit
  end

  def show
    @categories = Category.all
  end

  def update
      @book.update(book_params)
      redirect_to books_path
  end

  def destroy
  end
  private
  def book_params
   params.require(:book).permit(:title, :user_id, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :description, :pages, :year, :images
)
 end
 def set_books
  @book = Book.find(params[:id])
 end
end
