class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(current_user.id)
      flash[:success] = "投稿が成功しました"
    else
      render :new
    end
  end


  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:destroy] = "successfully delete"
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to user_path(current_user.id)
    else
      flash[:Failed] = "更新失敗"
      render :edit
    end
  end


 private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end


end
