class SessionsController < ApplicationController
  def new

  end

  def create
    # userにemailとpasswordを入力させて両方一致しているか調べる
    # まずemailから
    user = User.find_by(email:params[:session][:email].downcase)
    # 入力したuserとpasswordが一致しているか
    if user && user.authenticate(params[:session][:password])
      # userがログインできたらuserページにリダイレクト
      # helperで定義したlog_inメソッドlog_in(user)
      log_in user
      redirect_to user
    else
      # errorメッセージを表示
      flash.now[:danger] = "emaiとpasswordが正しくありません"
      render "new"
    end
  end

  def destroy
      log_out
      redirect_to root_path
  end
end
