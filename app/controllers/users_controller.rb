class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user , only: [:index, :edit, :update]
  # before_action :correct_user ,only: [:edit, :destroy]

  def index
    @users = User.all
  end
  
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:succses] = "Welcome to Task app!"
      redirect_to @user
    else
      render "new"
    end
  end

  def update
      if @user.update(user_params)
         redirect_to @user, notice: 'User was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.' 
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,:image,)
    end
# ログイン済みか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] =  "ログインしてください"
        redirect_to login_path
      end 
    end

    # 正しいユーザーか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
