class BooksController < ApplicationController
    before_action :authenticate_user!
  before_action :current_user, only: [:edit, :destroy, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
       redirect_to book_path(@book), notice:"You have created book successfully."
     else
      @books = Book.all
       render action: :index
     end
  end

  def index
        @book = Book.new
        @books = Book.all

  end

  def show
        @newbook = Book.new
        @book = Book.find(params[:id])
        @user = @book.user

  end

  def edit
      @book = Book.find(params[:id])
      @user = @book.user
     if @user != current_user
         redirect_to books_path
     end
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book), notice:"You have updated book successfully."
   else
     render action: :edit
   end
  end

  def destroy
        @book = Book.find(params[:id])
        @book.destroy
          redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
