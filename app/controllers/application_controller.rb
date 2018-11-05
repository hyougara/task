class ApplicationController < ActionController::Base
    before_action :get_category

    include SessionsHelper


    def get_category
        @category = Category.all
    end

end
