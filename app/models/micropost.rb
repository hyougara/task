class Micropost < ApplicationRecord
    validates :title, presence: true, length:{maximum:50}
    validates :content,presence:true, length:{maximum:255}
    belongs_to :category
    enum status:{draft: 0 ,pulished: 1}
end
