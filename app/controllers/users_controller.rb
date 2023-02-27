class UsersController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]


  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
    @users = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.book_id = current_book.id
    if @user.save
    redirect_to books_path(@book.id)
    flash[:signed_up] = "アカウント登録が完了しました"
    else
      flash[:danger] = "ログインに失敗しました"
      @users = User.all
      @user = User.all
      render :index
    end
  end


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show

    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:successful] = "プロフィール更新成功"
  end


 private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction)
  end


  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to book_path
    end
  end


end