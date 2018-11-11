class ApplicationController < ActionController::Base
    # before_action :get_category

    include SessionsHelper
    # ログイン済みか確認
    # これでどのコントローラーからでも呼び出せる
    private
        def logged_in_user
            unless logged_in?
                flash[:danger] =  "ログインしてください"
                redirect_to login_path
            end 
        end


    # def get_category
    #     @category = Category.all
    # end

end
