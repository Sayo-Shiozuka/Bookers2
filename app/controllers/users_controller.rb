class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
end
