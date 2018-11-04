class Micropost < ApplicationRecord
    validates :title, presence: true, length:{maximum:50}
    validates :content,presence:true, length:{maximum:255}
    belongs_to :category
    enum status:{draft: 0 ,woking: 1 ,pulished: 2}

    # class << self
    #     def localed_statuses
    #         statuses.keys.map do |s|
    #         [ApplicationController.helpers.t("status.micropost.#{s}"),s]
    #         end
    #     end
    # end
end
