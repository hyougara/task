class Micropost < ApplicationRecord
    validates :title, presence: true, length:{maximum:50}
    validates :content,presence:true, length:{maximum:255}
    # カテゴリに属している
    # belongs_to :category
    belongs_to :user
    # enumで状態を定義する(未着手、着手、完了)
    enum status:{draft: 0 ,working: 1 ,published: 2}
    enum priority:{low: 0 ,medium: 1 ,high: 2}
    # デフォルトで投稿が降順になる、全てのクエリに適用
    # default_scope -> {order(created_at: :desc) }
    #:labels  post.label_listが追加される タグのリスト名を決められる    
    acts_as_taggable_on  :tag
    # acts_as_taggable # acts_as_taggable_on :tags のエイリアス
    
    def self.search(search)# selfでクラスメソッドとしてる
        if search # Controllerから渡されたパラメーターが!= nilの場合は、titleカラムを部分一致検索
            Micropost.where('title LIKE ? ',"%#{search}%")
        else
            Micropost.all
        end
    end



    # def limit_order
    #     limit_order = Micropost.order(create_on: :desc)
    # end

    # irb(main):028:0> Micropost.statuses_i18n
    # => {"draft"=>"未着手", "woking"=>"Woking", "published"=>"完了"}
    # irb(main):029:0> Micropost.statuses_i18n.invert
    # => {"未着手"=>"draft", "Woking"=>"woking", "完了"=>"published"}
end
