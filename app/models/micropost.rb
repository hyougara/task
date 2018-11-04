class Micropost < ApplicationRecord
    validates :title, presence: true, length:{maximum:50}
    validates :content,presence:true, length:{maximum:255}
    # カテゴリに属している
    belongs_to :category
    # enumで状態を定義する(未着手、着手、完了)
    enum status:{draft: 0 ,woking: 1 ,pulished: 2}
    # デフォルトで投稿が降順になる、全てのクエリに適用
    default_scope -> {order(created_at: :desc) }    
    
    def self.search(search)# selfでクラスメソッドとしてる
        if search # Controllerから渡されたパラメーターが!= nilの場合は、titleカラムを部分一致検索
            Micropost.where(['title LIKE ?',"%#{search}%"])
        else
            Micropost.all
        end
    end
    
    # class << self
    #     def localed_statuses
    #         statuses.keys.map do |s|
    #         [ApplicationController.helpers.t("status.micropost.#{s}"),s]
    #         end
    #     end
    # end
end
