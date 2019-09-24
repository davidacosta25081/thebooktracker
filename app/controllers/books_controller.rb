class BooksController < ApplicationController

def index
    if params[:user_id]
      @books = User.find(params[:user_id]).books
      flash.now[:danger] = "You haven't added any books yet!" if @books.empty?
    else
      @books = Book.all
    end
  end


  def new
    @book = Book.new
    @book.reviews.build
  end

  
  def create
    @book = Book.create(book_params)
    @book.reviews.last.user = current_user
    if @book.save!
       redirect_to book_path(@book)
    else
      render :new
    end
  end

  

  def show
    @book = Book.find(params[:id])
  end







private
  def book_params
    params.require(:book).permit(:title, :author_first_name, :author_last_name, :genre_name, reviews_attributes: [:content])
  end





end
