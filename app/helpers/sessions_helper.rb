module SessionsHelper
    # 渡されたUser.idでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    # 現在ログイン中のuserがいれば返す
    def current_user
        if session[:user_id]
            # @current_user = @current_user || User.find_by(id: session[:user_id])の短縮
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # userがログインしていればtrue,その他ならばfalse
    def logged_in?
        !current_user.nil?
    end

    # logout追加
    def log_out
        session.delete(:user_id)
        @current_user = nil?
    end
end