class User < ApplicationRecord
    validates :name, presence: true, length:{maximum:50}
    validates :email, presence: true, length:{maximum:140}
    # passwordとpassword_confirmationが追加される
    has_secure_password
    # has_many :categories 
    has_many :microposts ,dependent: :destroy
    def feed
        Micropost.where("user_id = ?", id)
    end

end
