class MicropostsController < ApplicationController

  # before_actionを定義すれば共通で使用出来、各action前に実行される
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  
  def index
    # @micropost = Micropost.all
    @category = Category.all
    # viewのformで取得したパラメーターをモデルに返す
    @micropost = Micropost.search(params[:search])
    # ransack
    @search = Micropost.ransack(params[:q])
    @micropost = @search.result
    # これだとソートできなくなる
    # @micropost = Micropost.order(create_on: :asc)
  end

  def new
    @micropost = Micropost.new
  end

  def show

  end

  def create
    @micropost = Micropost.new(micropost_params)
    
    if @micropost.save
      flash.now[:succese] = "登録しました"
      redirect_to microposts_path
    else
      flash.now[:danger] = "登録できませんでした"
      render "new"
    end
  end

  def edit

  end

  def update
    if @micropost.update(micropost_params)
      redirect_to microposts_path
    else
      render :edit
    end

  end

  def destroy
    @micropost.destroy
    redirect_to microposts_url
  end

  private
  # before_actionを定義
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end
# micropost_paramsを定義
    def micropost_params
      params.require(:micropost).permit(:title, :content, :category_in, :status, :user_id, :create_on, :title_cont,
        :category_id_in, :status_in, :priority, :create_on_in)
    end
end
