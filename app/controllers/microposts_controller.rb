class MicropostsController < ApplicationController

  # before_actionを定義すれば共通で使用出来、各action前に実行される
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user , only: [:create, :destroy]
  before_action :currect_user , only: :destroy
  
  def index
    # @micropost = Micropost.all
    # viewのformで取得したパラメーターをモデルに返す
    # @micropost = Micropost.search(params[:search])

    # ransack
    @search = Micropost.ransack(params[:q])
    @micropost =@search.result.page(params[:page])  

    # これだとソートできなくなる
    # @micropost = Micropost.order(create_on: :asc)
  end

  def new
    @micropost = Micropost.new
  end

  def show

  end

  def create
    @micropost = current_user.microposts.build(micropost_params)

    if @micropost.save
      flash.now[:succese] = "登録しました"
      redirect_to microposts_url
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
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
  # before_actionを定義
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end
# micropost_paramsを定義
    def micropost_params
      params.require(:micropost).permit(:title, :content, :status, :user_id, :create_on, :title_cont,
                    :status_in, :priority, :create_on_in, :tag_list)
    end

    def currect_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_path #if @micropost.nill?
    end

end