class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  def index
    @micropost = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def show

  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to @micropost
    else
      flash.now[:notice] = "登録できませんでした"
      render "new"
    end
  end

  def edit

  end

  def update
    @micropost.update
    redirect_to @micropost

  end

  def destroy
    @micropost.destroy
    redirect_to microposts

  end

  private
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:title, :content)
    end
end
